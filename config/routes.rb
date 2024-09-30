Rails.application.routes.draw do
  root "home#index"

  get "home/index"
  get "users/index"
  get "users/show"
  get "users/new"
  get "users/edit"
  get "users/delete"
  get "users/login"
  get "users/attempt_logout", to: "users#attempt_logout"
  
  post "users/create"
  post "users/attempt_login", to: "users#attempt_login"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
