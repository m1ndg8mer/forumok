Rails.application.routes.draw do
  root to: 'static_pages#home'

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :categories do
    resources :messages, only: [:new, :create, :destroy]
    member do
      patch :publish
    end
  end

  namespace :admin do
    resources :users, only: [:index] do
      member do
        patch :change_role
      end
    end
  end

end
