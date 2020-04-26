Rails.application.routes.draw do
  devise_for :users, controllers:{
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',

    invitations: 'users/invitations'
  }
  
  root "posts#index"
  resources :posts do
    resources :comments, only: :create
end

end
