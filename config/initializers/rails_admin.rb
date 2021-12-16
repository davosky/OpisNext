# frozen_string_literal: true

RailsAdmin.config do |config|
  config.authorize_with do
    redirect_to main_app.root_path unless current_user.admin == true
  end

  config.parent_controller = 'ApplicationController'

  config.main_app_name = ['Opis Next Generation']

  config.model 'User' do
    visible true
    label 'Utente'
    label_plural 'Utenti'
  end

  config.model 'Howto' do
    visible true
    label 'Guida'
    label_plural 'Guide'
  end

  config.model 'Category' do
    visible true
    label 'Categoria'
    label_plural 'Categorie'
  end

  config.model 'IncaOffice' do
    visible true
    label 'Ufficio INCA'
    label_plural 'Uffici INCA'
  end

  config.model 'IncaPractise' do
    visible true
    label 'Pratica INCA'
    label_plural 'Pratiche INCA'
  end

  config.model 'PaymentTypology' do
    visible true
    label 'Tipo Pagamento'
    label_plural 'Tipi Pagamento'
  end

  config.model 'IncaReceipt' do
    visible true
    label 'Ricevuta INCA'
    label_plural 'Ricevute INCA'
  end

  config.model 'SubscriptionTypology' do
    visible true
    label 'Tipo Sottoscrizione'
    label_plural 'Tipi Sottoscrizione'
  end

  config.model 'SubscriptionYear' do
    visible true
    label 'Anno Sottoscrizione'
    label_plural 'Anni Sottoscrizione'
  end

  config.model 'CompanyTypology' do
    visible true
    label 'Tipo Azienda'
    label_plural 'Tipi Azienda'
  end

  config.model 'PrivacyOne' do
    visible true
    label 'Privacy Uno'
    label_plural 'Privacy Uno'
  end

  config.model 'PrivacyTwo' do
    visible true
    label 'Privacy Due'
    label_plural 'Privacy Due'
  end

  config.model 'PrivacyThree' do
    visible true
    label 'Privacy Tre'
    label_plural 'Privacy Tre'
  end

  config.model 'Sex' do
    visible true
    label 'Sesso'
    label_plural 'Sessi'
  end

  config.model 'WorkLevel' do
    visible true
    label 'Livello'
    label_plural 'Livelli'
  end

  config.model 'WorkQualify' do
    visible true
    label 'Qualifica'
    label_plural 'Qualifiche'
  end

  config.model 'WorkWorker' do
    visible true
    label 'Tipo Lavoratore'
    label_plural 'Tipi Lavoratore'
  end

  config.model 'IncaSubscription' do
    visible true
    label 'Sottoscrizione INCA'
    label_plural 'Sottoscrizioni INCA'
  end

  config.model 'Tariff' do
    visible true
    label 'Tariffa Categoria'
    label_plural 'Tariffe Categorie'
  end

  config.model 'GenericSubscription' do
    visible true
    label 'Sottoscrizione GENERICA'
    label_plural 'Sottoscrizioni GENERICHE'
  end

  config.model 'GenericOffice' do
    visible true
    label 'Ufficio GENERICO'
    label_plural 'Uffici GENERICI'
  end

  config.model 'GenericPractise' do
    visible true
    label 'Pratica GENERICA'
    label_plural 'Pratiche GENERICHE'
  end

  config.actions do
    dashboard
    index
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
