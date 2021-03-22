Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :events, only: [:index, :show, :new, :create, :destroy] do 
    member do
      get "attend"
    end
  end

  root "users#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
