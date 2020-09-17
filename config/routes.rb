Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
get 'auth/:provider/callback' => 'sessions#create'

  resources :users
  resources :books do
    collection do
       get :read
       get :unread
    end
  end
  resources :genres, only: [:new, :create, :index] do
    resources :books, only: [:show, :index, :new]
  end
get 'signup', to: 'users#new'
get 'login', to: 'sessions#new'
post 'login', to: 'sessions#create'
delete 'logout', to: 'sessions#destroy'


  root 'static#home'
end
