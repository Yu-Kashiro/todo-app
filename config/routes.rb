Rails.application.routes.draw do
  devise_for :users
  root to: 'boards#index'

  resources :boards do
    resources :tasks do
      resources :comments
    end

  end



  resource :profile, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
