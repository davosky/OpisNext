# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'dashboard#index'

  resources :howtos
  get 'dashboard/index'
  get 'dashboard/credits'
  get 'dashboard/authorization'

  devise_for :users, skip: [:registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :inca_receipts do
    collection do
      get :billdownload
    end
  end

  resources :inca_subscriptions do
    collection do
      get :billdownload
      get :billdownloadnidil
    end
  end

  resources :generic_subscriptions do
    collection do
      get :billdownload
      get :billdownloadnidil
    end
  end
end
