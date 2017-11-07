Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :index]
  get '/last_logged_in_users' => 'users#index', as: :last_logged_in_users
end
