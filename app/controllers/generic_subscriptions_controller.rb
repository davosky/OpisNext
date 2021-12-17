class GenericSubscriptionsController < ApplicationController
  load_and_authorize_resource

  before_action :set_generic_subscription, only: %i[show edit update destroy]

  def index
    @user = current_user
    @q = GenericSubscription.ransack(params[:q])
    @generic_subscriptions = @q.result(didtinct: true).order(name: 'DESC')
                               .paginate(page: params[:page], per_page: 10)
    @tariffs = Tariff.all.order(position: 'ASC')
  end

  def show
    @tariffs = Tariff.all.order(position: 'ASC')
    respond_to do |format|
      format.html
      format.json
      format.pdf { render template: 'generic_subscriptions/pdfgenericsubscription', pdf: 'pdfgenericsubscription' }
    end
  end

  def billdownload
    @tariffs = Tariff.all.order(position: 'ASC')
    @q = GenericSubscription.ransack(params[:q])
    @generic_subscriptions = @q.result(distinct: true)
                               .order(name: 'ASC')
                               .where(cancellation: [false, nil])
                               .where.not(category_id: 9)
    respond_to do |format|
      format.html
      format.json
      format.pdf { render template: 'generic_subscriptions/pdfbilldownload', pdf: 'pdfbilldownload' }
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

  def billdownloadnidil
    @tariffs = Tariff.all.order(position: 'ASC')
    @q = GenericSubscription.ransack(params[:q])
    @generic_subscriptions = @q.result(distinct: true)
                               .order(name: 'ASC')
                               .where(cancellation: [false, nil])
                               .where(category_id: 9)
    respond_to do |format|
      format.html
      format.json
      format.pdf { render template: 'generic_subscriptions/pdfbilldownloadnidil', pdf: 'pdfbilldownload' }
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
    @generic_subscription = GenericSubscription.new
    @tariffs = Tariff.all.order(position: 'ASC')
  end

  def edit
    redirect_to generic_subscriptions_path if @generic_subscription.cancellation.present?
    @tariffs = Tariff.all.order(position: 'ASC')
  end

  def create
    @generic_subscription = current_user.generic_subscriptions.build(generic_subscription_params)
    @generic_subscription.date = Date.today
    @generic_subscription.institute = current_user.institute
    @tariffs = Tariff.all.order(position: 'ASC')
    respond_to do |format|
      if @generic_subscription.save
        format.html { redirect_to generic_subscriptions_path, notice: 'generic subscription was successfully created.' }
        format.json { render :show, status: :created, location: @generic_subscription }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @generic_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @tariffs = Tariff.all.order(position: 'ASC')
    respond_to do |format|
      if @generic_subscription.update(generic_subscription_params)
        format.html { redirect_to generic_subscriptions_path, notice: 'generic subscription was successfully updated.' }
        format.json { render :show, status: :ok, location: @generic_subscription }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @generic_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tariffs = Tariff.all.order(position: 'ASC')
    @generic_subscription.destroy
    respond_to do |format|
      format.html { redirect_to generic_subscriptions_url, notice: 'generic subscription was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_generic_subscription
    @generic_subscription = GenericSubscription.find(params[:id])
  end

  def generic_subscription_params
    params.require(:generic_subscription).permit(:generic_office_id, :subscription_typology_id, :customer_name,
                                                 :customer_forname, :sex_id, :customer_birth_place, :customer_birth_date, :customer_fiscal_code, :customer_nationality, :customer_address, :customer_zip, :customer_city, :customer_province, :customer_phone, :customer_mobile, :customer_email, :company_vat_number, :company_fiscal_code, :company_name, :company_address, :company_zip, :company_city, :company_province, :company_typology_id, :work_qualify_id, :work_level_id, :work_contract, :work_worker_id, :work_employee_date, :work_workplace, :payment, :payment_typology_id, :category_id, :subscription_year_id, :generic_practise_id, :privacy_one_id, :privacy_two_id, :privacy_three_id, :note, :cancellation, :cancellation_reason, :name, :date, :institute, :user_id, :pdf)
  end
end
