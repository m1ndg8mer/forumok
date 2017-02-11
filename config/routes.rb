Rails.application.routes.draw do
  root 'static_pages#home'

  resources :categories do
    resources :messages, only: [:new, :create, :destroy]
  end
end
