Rails.application.routes.draw do
  devise_for :users, controllers: {
   registrations: 'users/registrations'
 }
  root to: "groups#index"
  resources :groups, only: [:create, :destroy, :index] do
    resources :messages, only: [:index, :new, :create, :edit, :update, :destroy] do
      collection do
        get 'search'
      end
      resources :favorites, only: [:create, :destroy]
      resources :comments , only: [:new, :create, :destroy]
    end
  end
  resources :user, only: :show
end
