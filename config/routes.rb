Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    invitations: 'users/invitations',
  }
  resources :users, only: [:index, :show, :edit, :update]
  
  root "posts#index"
  resources :posts do
    resources :comments, only: :create
end

end
