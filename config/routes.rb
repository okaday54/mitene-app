Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  
  root "posts#index"
  resources :posts do
    resources :comments, only: :create
end

end
