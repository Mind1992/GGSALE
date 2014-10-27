Rails.application.routes.draw do
  devise_for :users, :path => 'accounts', path_names: {sign_in: "login", sign_out: "logout"}
  root to: "sales#index"

  resources :users
  resources :sales do
  	put :favorite, on: :member
  	resources :photos
  	collection do
  		get 'search'
      get 'favorites'
      get 'current_user_sales'
  	end
  end
end
