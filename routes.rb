# frozen_string_literal: true

Rails.application.routes.draw do
  resources :cidades
  resources :estabelecimentos
  devise_for :users
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'

  # Paginas de examplos
  get '/exemplos/index.html', to: 'exemplos#index', as: 'exemplos'
  get '/exemplos/component-alert.html', to: 'exemplos#component-alert'
end
