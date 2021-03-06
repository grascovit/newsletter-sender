# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  devise_scope :user do
    authenticated :user do
      root to: 'newsletters#index', as: :authenticated_root
    end

    unauthenticated :user do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :newsletters do
    resources :sendings, only: %i[create], controller: 'newsletters/sendings'
  end
  resources :recipients, except: %i[show]
  resources :recipient_lists
  resources :senders, except: %i[show]
  resources :templates
end
