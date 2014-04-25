Rails.application.routes.draw do
  resources :categories do
    resources :products
  end

  root 'products#index'
end
