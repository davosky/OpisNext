# frozen_string_literal: true

class IncaReceiptsController < ApplicationController
  load_and_authorize_resource

  before_action :set_inca_receipt, only: %i[show edit update destroy]

  def index
    @user = current_user
    @q = IncaReceipt.ransack(params[:q])
    @inca_receipts = if @user.admin == true || @user.institute == 'Ufficio Amministrazione'
                       @q.result(distinct: true).order(name: 'DESC')
                         .paginate(page: params[:page], per_page: 10)
                     else
                       @q.result(distinct: true).where(user_id: @user.id)
                         .order(name: 'DESC').paginate(page: params[:page], per_page: 10)
                     end
  end

  def show
    respond_to do |format|
      format.html
      format.json
      format.pdf { render template: 'inca_receipts/pdfincareceipt', pdf: 'pdfincareceipt' }
    end
  end

  def new
    @inca_receipt = IncaReceipt.new
  end

  def edit
    redirect_to inca_receipts_path if @inca_receipt.cancellation.present?
  end

  def billdownload
    @user = current_user
    if @user.admin == true || @user.institute == 'Ufficio Amministrazione'
      @q = IncaReceipt.ransack(params[:q])
      @inca_receipts = @q.result(distinct: true)
                         .where(cancellation: [false, nil])
                         .order(name: 'DESC')
    else
      @q = IncaReceipt.ransack(params[:q])
      @inca_receipts = @q.result(distinct: true).order(name: 'DESC')
                         .where(user_id: @user.id)
                         .where(cancellation: [false, nil])
    end
    respond_to do |format|
      format.html
      format.json
      format.pdf { render template: 'inca_receipts/pdfbilldownload', pdf: 'pdfbilldownload' }
      format.xlsx
    end
    @totale
    @totalegenerale
    @ufficio
    @contanti
    @contantitotale
    @pos
    @postotale
    @bonifico
    @bonificototale
    @ccpostale
    @ccpostaletotale
    @altro
    @altrototale
  end

  def create
    @inca_receipt = current_user.inca_receipts.build(inca_receipt_params)
    @inca_receipt.date = Date.today
    @inca_receipt.institute = current_user.institute
    respond_to do |format|
      if @inca_receipt.save
        format.html { redirect_to inca_receipts_path, notice: 'Inca receipt was successfully created.' }
        format.json { render :show, status: :created, location: @inca_receipt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inca_receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @inca_receipt.update(inca_receipt_params)
        format.html { redirect_to inca_receipts_path, notice: 'Inca receipt was successfully updated.' }
        format.json { render :show, status: :ok, location: @inca_receipt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inca_receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @inca_receipt.destroy
    respond_to do |format|
      format.html { redirect_to inca_receipts_url, notice: 'Inca receipt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_inca_receipt
    @inca_receipt = IncaReceipt.find(params[:id])
  end

  def inca_receipt_params
    params.require(:inca_receipt).permit(:inca_office_id, :customer_name,
                                         :customer_forname, :customer_birth_place,
                                         :customer_birth_date, :customer_fiscal_code,
                                         :customer_address, :customer_zip,
                                         :customer_city, :customer_province,
                                         :payment, :payment_typology_id, :note, :name,
                                         :date, :user_id, :institute, :pdf, :cancellation,
                                         :cancellation_reason)
  end
end
