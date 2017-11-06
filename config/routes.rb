Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/recent_logged_in_users' => 'users#index', as: :recent_logged_in_users

end
