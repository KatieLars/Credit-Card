Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'accounts#index'

  resources :accounts, only: [:new, :create, :show, :edit, :update]
  resources :transactions, only: [:create, :new]
end
