Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations', sessions: 'users/sessions' }

  namespace :billisearch do
    get 'home'
    resources :halls
  end
end
