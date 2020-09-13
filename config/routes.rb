Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :books
  resources :genres do
    resources :books, only: [:show, :index, :new]
  end

get 'login', to: 'session#new'
post 'login', to: 'session#create'
delete 'logout', to: 'session#destroy'

  root 'static#home'
end
