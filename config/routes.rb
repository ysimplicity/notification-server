Rails.application.routes.draw do
  namespace :api do
    resources :users, only: :create
  end

  resources :users, only: :index
  resources :campaigns, except: [:edit, :update]
  
  namespace :campaigns, controller: 'publish' do
    post 'publish/:id', action: :create, as: :publish
  end
  
  root 'campaigns#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
