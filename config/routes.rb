Rails.application.routes.draw do
  devise_for :users
  resources :categories do
    resources :products
  end

  root 'products#index'
end
