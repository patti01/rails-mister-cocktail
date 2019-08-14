Rails.application.routes.draw do
  get 'reviews/create'
  root to: 'cocktails#index'
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:create]
    resources :reviews, only: [:create]
  end
  resources :doses, only: [:destroy]
end
