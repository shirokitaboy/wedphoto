Rails.application.routes.draw do
  root 'posts#top'
  get 'posts/gallery', to: 'posts#gallery'
  resources :posts, only: [:index, :new, :create, :edit, :update, :show, :destroy]do
    resources :recomments, only: [:create]
    collection do
      post :confirm
    end
  end
  resources :users do
    collection do
      post :confirm
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
  resources :recomments, only: [:create, :destroy]
  root 'posts#index'
end
