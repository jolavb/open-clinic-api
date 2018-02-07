# frozen_string_literal: true

Rails.application.routes.draw do

  resources :sponsors, only: %i[index show]
  resources :responsible_parties, only: %i[index show]
  resources :comments
  resources :studies, only: %i[index show]
  # resources :examples, except: %i[new edit]
  get '/u_sponsors/:id' => 'u_sponsors#show'
  get '/u_sponsors' => 'u_sponsors#index'

  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: %i[index show]
end
