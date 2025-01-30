Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users
  resources :escalacmpts do
    resources :escaladays
    get 'resumo'
  end
  resources :equipes do
    resources :membros
  end
  resources :conselhoclasses
  resources :cidades
  resources :estabelecimentos do
    collection do
      get :cidades
    end
    resources :unidades
  end
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
  get 'search', to: 'search#perform'
  resources :plantoes do
    member do
      post 'abrir_plantao'
      post 'fechar_plantao'
    end
  end

  # API
  namespace :api do
    namespace :v1 do
      resources :escalas
    end
    post 'users_login' => 'users#login'
    post 'users_logout' => 'users#logout'
  end

  get '/verificar_localizacao', to: 'localizacao#index'

  match '/403', to: 'errors#unacceptable', via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  # get "mordomo_error", to: "errors#mordomo_error", via: :all
  get '*unmatched_route', to: 'errors#not_found'
end
