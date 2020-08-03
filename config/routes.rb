Rails.application.routes.draw do
  devise_for :users
  root "incomes#index"
  # get 'posts', to: "incomes#new"
	# post "incomes/index"
  resources :users, only: [:edit, :update]
  resources :incomes, only: [:new, :create, :index, :show]
end
