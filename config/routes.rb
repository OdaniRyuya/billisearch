Rails.application.routes.draw do
  get 'users/show'

  devise_for :users, controllers: {registrations: 'users/registrations', sessions: 'users/sessions' }
  resources :users, :only => [:show]
  
  namespace :billisearch do

    get 'home'
    resources :halls
  end
end
