Rails.application.routes.draw do
  root "messages#new"
  resources :messages, only: [:new, :create]
  resources :calls, only: [:create]

  post 'connect' => 'calls#connect'
end
