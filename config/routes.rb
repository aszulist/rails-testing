Rails.application.routes.draw do
  root 'welcome#index'

  resources :achievements, only: [:show, :new, :create]
end
