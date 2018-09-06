Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :users, only: [:new, :create] do
    resources :ideas
    resources :images, only: [:index, :show]
  end

  namespace :admin do
    resources :categories, only: [:new, :create, :destroy, :index]
    resources :images, only: [:new, :create, :destroy, :index]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
