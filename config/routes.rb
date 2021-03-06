Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'accounts#index'

  resources :accounts, only: [:new, :create, :show, :edit, :update]
  get '/search' => 'accounts#search'
  resources :accounts, only: [:show] do
    resources :transactions, only: [:create, :new]
  end
end
