class IncaSubscriptionsController < ApplicationController
  load_and_authorize_resource

  before_action :set_inca_subscription, only: %i[show edit update destroy]

  def index
    @user = current_user
    @q = IncaSubscription.ransack(params[:q])
    @inca_subscriptions = @q.result(didtinct: true).order(name: 'DESC')
                            .paginate(page: params[:page], per_page: 10)
    @tariffs = Tariff.all.order(position: 'ASC')
  end

  def show
    @tariffs = Tariff.all.order(position: 'ASC')
    respond_to do |format|
      format.html
      format.json
      format.pdf { render template: 'inca_subscriptions/pdfincasubscription', pdf: 'pdfincasubscription' }
    end
  end

  def billdownload
    @tariffs = Tariff.all.order(position: 'ASC')
    @q = IncaSubscription.ransack(params[:q])
    @inca_subscriptions = @q.result(distinct: true)
                            .order(name: 'ASC')
                            .where(cancellation: [false, nil])
    respond_to do |format|
      format.html
      format.json
      format.pdf { render template: 'inca_subscriptions/pdfbilldownload', pdf: 'pdfbilldownload' }
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

  def new
    @inca_subscription = IncaSubscription.new
    @tariffs = Tariff.all.order(position: 'ASC')
  end

  def edit
    redirect_to inca_subscriptions_path if @inca_subscription.cancellation.present?
    @tariffs = Tariff.all.order(position: 'ASC')
  end

  def create
    @inca_subscription = current_user.inca_subscriptions.build(inca_subscription_params)
    @inca_subscription.date = Date.today
    @inca_subscription.institute = current_user.institute
    @tariffs = Tariff.all.order(position: 'ASC')
    respond_to do |format|
      if @inca_subscription.save
        format.html { redirect_to inca_subscriptions_path, notice: 'Inca subscription was successfully created.' }
        format.json { render :show, status: :created, location: @inca_subscription }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inca_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @tariffs = Tariff.all.order(position: 'ASC')
    respond_to do |format|
      if @inca_subscription.update(inca_subscription_params)
        format.html { redirect_to inca_subscriptions_path, notice: 'Inca subscription was successfully updated.' }
        format.json { render :show, status: :ok, location: @inca_subscription }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inca_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tariffs = Tariff.all.order(position: 'ASC')
    @inca_subscription.destroy
    respond_to do |format|
      format.html { redirect_to inca_subscriptions_url, notice: 'Inca subscription was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_inca_subscription
    @inca_subscription = IncaSubscription.find(params[:id])
  end

  def inca_subscription_params
    params.require(:inca_subscription).permit(:inca_office_id, :subscription_typology_id, :customer_name,
                                              :customer_forname, :sex_id, :customer_birth_place, :customer_birth_date, :customer_fiscal_code, :customer_nationality, :customer_address, :customer_zip, :customer_city, :customer_province, :customer_phone, :customer_mobile, :customer_email, :company_vat_number, :company_fiscal_code, :company_name, :company_address, :company_zip, :company_city, :company_province, :company_typology_id, :work_qualify_id, :work_level_id, :work_contract, :work_worker_id, :work_employee_date, :work_workplace, :payment, :payment_typology_id, :category_id, :subscription_year_id, :inca_practise_id, :privacy_one_id, :privacy_two_id, :privacy_three_id, :note, :cancellation, :cancellation_reason, :name, :date, :institute, :user_id, :pdf)
  end
end
