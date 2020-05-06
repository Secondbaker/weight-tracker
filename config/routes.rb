Rails.application.routes.draw do
  devise_for :users
  resources :data_groups
  resources :measurement_data, only: [:show, :edit, :update, :destroy]
  get 'input', to: 'data_groups#input', as: :input
  post 'save_input', to: 'data_groups#save_input', as: :save_input
  root "data_groups#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
