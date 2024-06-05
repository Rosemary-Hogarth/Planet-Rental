Rails.application.routes.draw do
  devise_for :users
  resources :planets do
    resources :bookings, only: [:new, :create, :show] do
      member do
        patch :accept
        patch :reject
      end
    end
  end
  root to: "pages#home"
  get 'dashboard', to: 'dashboards#index'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
