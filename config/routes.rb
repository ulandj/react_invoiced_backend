Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v1, defaults: { format: :json } do
    resources :accounts, only: [:create, :update] do
      resources :contacts
    end
    resource :sessions, only: [:create, :destroy, :show]
    resources :users, only: [:create]
  end
end
