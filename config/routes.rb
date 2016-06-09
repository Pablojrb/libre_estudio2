Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:index, :show] do
    resources :documents
  end

  authenticated :user do
    root 'users#dashboard', as: "authenticated_root"
  end

  root 'welcome#index'
end
