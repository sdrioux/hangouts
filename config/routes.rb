Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#index'

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  get '/hangout', to: 'hangouts#show', param: :user_id
  resources :messages
  resources :users
end
