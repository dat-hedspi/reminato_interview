Rails.application.routes.draw do
  get 'share/index'
  root to: "static_pages#index"
  devise_for :users, path: '',
    path_names: { sign_in: 'login', sign_out: 'logout', registration: 'register', sign_up: 'sign_up' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts, only: %w[create update destroy]
  resources :shares, only: %w[index edit]
end
