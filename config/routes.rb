Rails.application.routes.draw do
  post '/register', to: 'auth#register'
  post '/login', to: 'auth#login'

  get 'up' => 'rails/health#show', as: :rails_health_check
end