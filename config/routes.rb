Rails.application.routes.draw do
  devise_for :users

  resources :categories do
    resources :products do
      resources :reviews
    end
  end

  root 'categories#index'
end
