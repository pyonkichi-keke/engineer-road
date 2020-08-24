Rails.application.routes.draw do
  devise_for :users, controllers: {
   registrations: 'users/registrations'
 }
  root to: "groups#index"
  resources :groups do
    resources :messages do
      collection do
        get 'search'
      end
      resources :favorites, only: [:create, :destroy]
      resources :comments , only: [:create, :destroy]
    end
  end
  resources :user, only: :show
end
