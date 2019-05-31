Rails.application.routes.draw do
  root 'billboards#index'

  resources :billboards
  resources :artists do
    resources :songs, only: [:index, :new, :create, :destroy]
  end
end
