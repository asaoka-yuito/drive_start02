Rails.application.routes.draw do
  get 'user_sessions/new'
  get 'user_sessions/create'
  get 'user_sessions/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root  'static_pages#top'
  
  #as オプションで名前を指定
  get 'login', to: 'sessions#new', as: :login
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy', as: :logout

  resources :users, only: [:new, :create, :show]
end
