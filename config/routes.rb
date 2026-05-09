Rails.application.routes.draw do
  post '/register', to: 'auth#register'
  post '/login', to: 'auth#login'

  resources :courses, only: [:index, :show, :create, :update, :destroy] do
    resources :lessons, only: [:index, :show, :create, :update, :destroy]
    resources :sections, only: [:index, :create, :update, :destroy]
    post 'chat', to: 'chat#create'
    post 'enroll', to: 'enrollments#create'
    delete 'unenroll', to: 'enrollments#destroy'
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end