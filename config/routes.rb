Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :events, only: [:index, :show, :new, :create, :destroy] do 
    member do
      post "attend"
    end
  end

  root "events#index"
end
