Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders, only: [:index]
  post '/basket', to: 'orders#basket', as: 'basket'
  delete '/remove_order', to: 'orders#remove_order', as: 'remove_order'
  put '/update_basket', to: 'orders#update_basket', as: 'update_basket'
  put '/checkout', to: 'orders#checkout', as: 'checkout'
  root 'orders#index'
end
