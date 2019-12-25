Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v1, defaults: { format: :json } do
    scope ':account_id' do
      resources :contacts, only: %i[index]

      resources :organizations, only: %i[create update] do
        resources :contacts, only: %i[create update destroy]
      end
    end

    resources :accounts, only: %i[create update]
    resource :sessions, only: %i[create destroy show]
    resources :users, only: %i[create]
  end
end
