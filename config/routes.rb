Rails.application.routes.draw do
  devise_for :users, :path => 'accounts', path_names: {sign_in: "login", sign_out: "logout"}
  root to: "users#index"

  resources :users 
  resources :sales

end
