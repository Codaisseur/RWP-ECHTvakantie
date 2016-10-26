Rails.application.routes.draw do
  devise_for :users

  resources :vacations, param: :title

  resources :themes, param: :name
  get '/thema/:name/*filters' => "themes#show"

  resources :tphotos
  resources :vphotos

  get 'theme_by_title' => 'themes#by_title'

  root 'themes#index'

  # get 'vacations/new' => 'vacations#new', as: :new_vacation             # what does ":as" mean ????
  # post 'vacations' => 'vacations#create'
  #
  # get 'vacations/:name' => 'vacations#show', as: :vacation              # what does ":as" mean ????
  # get 'vacations/:name/edit' => 'vacations#edit', as: :edit_vacation    # what does ":as" mean ????
  #
  # patch 'vacations/:name' => 'vacations#update'
  # delete 'vacations/:name' => 'vacations#destroy'
  #
  #
  # get 'themes/new' => 'themes#new', as: :new_theme            # what does ":as" mean ????
  # post 'themes' => 'themes#create'
  #
  # get 'themes/:name' => 'themes#show', as: :theme             # what does ":as" mean ????
  # get 'themes/:name/edit' => 'themes#edit', as: :edit_theme   # what does ":as" mean ????
  #
  # patch 'themes/:name' => 'themes#update'
  # delete 'themes/:name' => 'themes#destroy'




end
