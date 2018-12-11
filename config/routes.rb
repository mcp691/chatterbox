Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users

  resources :chat_rooms, only: [:new, :create, :show, :index, :destroy]

  mount ActionCable.server => '/cable'

  root 'chat_rooms#index'

end
