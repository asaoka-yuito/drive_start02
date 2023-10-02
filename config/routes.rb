Rails.application.routes.draw do
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
  resources :password_resets, only: %i[new create edit update]

  resource :profile,only: %i[show edit update]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?


  # 管理者用
  namespace :admin do
    root to: 'dashboards#index'
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy'
  end
end
