Rails.application.routes.draw do
  devise_for :users
  resources :categories do
    resources :products
  end

  root 'categories#index'
end
