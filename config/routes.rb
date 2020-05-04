Rails.application.routes.draw do
  devise_for :users
  resources :data_groups
  resources :measurement_data, only: [:show, :edit, :update, :destroy]
  root "data_groups#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
