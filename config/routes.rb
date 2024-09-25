Rails.application.routes.draw do
  root 'welcome#index'

  resources :user, only: [:index, :new, :create, :show, :edit, :update]
end
