Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :clients, only: [:index]
      resources :clients, only: [:show] do
        resources :payments, only: [:index]
        resources :transactions, only: [:index]
      end
    end
    root 'clients#index'
  end
end
