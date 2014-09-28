Rails.application.routes.draw do
  devise_for :users, :path => 'accounts', path_names: {sign_in: "login", sign_out: "logout"}
  root to: "sales#index"

  resources :users, :sales, :photos

end
