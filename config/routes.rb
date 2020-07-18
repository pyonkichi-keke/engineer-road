Rails.application.routes.draw do
  devise_for :users
  root to: "groups#index"
  resources :groups do
    resources :messages do
      resources :favorites
      resources :comments 
    end
  end
end
