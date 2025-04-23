require "sidekiq/web" # require the web UI

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"

  resource :session
  resources :passwords, param: :token
  resources :registration, only: %w[index create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  namespace :dashboard do
    get "/", to: "index", as: :index

    namespace :user do
      resource :settings, only: %w[edit update]

      namespace :friend_ship do
        get "/", to: "index"
        get "/new", to: "new"
        post "/create", to: "create"
        post "/search", to: "search_user"

        post "/accept", to: "accept_friendship"
      end

      # resources :posts
      get "/",           to: "show",                as: :show
      get "/recent_posts",  to: "posts#posts",         as: :recent_posts
      get "/friends_posts", to: "posts#friends_posts", as: :friends_posts

      namespace :posts do
        get "/", to: "index"
        post "/:id", to: "show", as: :show
        get "/new", to: "new"
        post "/", to: "create", as: :create

        namespace :like do
          post "/:user_post_id",         to: "create"
          get "/count/:id", to: "counter", as: :counter
        end

        namespace :comment do
          post "/:user_post_id", to: "index"
          post "/create/:user_post_id", to: "create", as: :create
        end
      end
    end
  end

  # get "/", to: "dashboard#root"

  root "dashboard#root"
end
