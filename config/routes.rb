Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: {registrations: 'users/registrations', sessions: 'users/sessions' }
  resources :users, :only => [:show] 
  resources :reviews, :only => [:new, :create, :destroy] 
  post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
  delete 'favorite/:id' => 'favorites#destroy', as: 'destroy_favorite'

  namespace :billisearch do
    get 'terms_page'
    get 'home'
    root 'home'
    post 'new_guest'
    resources :halls
  end
end
