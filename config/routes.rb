Rails.application.routes.draw do
  get 'bookmarks/create'
  get 'bookmarks/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root  'static_pages#top'
  
  #as オプションで名前を指定
  get 'login', to: 'user_sessions#new', as: :login
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy', as: :logout

  resources :users, only: %i[new create show]
  resources :posts do
    resources :comments, only: %i[create destroy], shallow: true
    collection do
      get 'bookmarks'
    end
  end

  resources :bookmarks, only: %i[create destroy]

end
