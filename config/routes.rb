Rails.application.routes.draw do
  root 'billisearch#home'
  get 'users/show'
  devise_for :users, controllers: {registrations: 'users/registrations', sessions: 'users/sessions' }
  resources :users, :only => [:show] 
  resources :reviews, :only => [:new, :create, :destroy] 
  post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
  delete 'favorite/:id' => 'favorites#destroy', as: 'destroy_favorite'

  namespace :billisearch do
    get 'home'
    get 'terms_page'
    post 'new_guest'
    resources :halls
  end
end
