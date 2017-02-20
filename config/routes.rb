Rails.application.routes.draw do
  root to: 'static_pages#home'

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :categories do
    resources :messages, only: [:new, :create, :destroy]
    member do
      get :publish
    end
  end

  namespace :admin do
    resources :users, only: [:index] do
      member do
        get :change_role
      end
    end
  end

end
