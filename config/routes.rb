Rails.application.routes.draw do


  namespace :billisearch do
    get 'home'
    resources :halls
  end
end
