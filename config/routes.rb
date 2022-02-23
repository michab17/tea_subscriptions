Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :subscriptions, only: [:create, :update]
      get '/subscriptions/:customer_id', to: 'subscriptions#index'
    end
  end
end
