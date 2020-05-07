Rails.application.routes.draw do
  devise_for :users
  resources :data_groups, path: 'charts'
  resources :measurement_data, only: [:show, :edit, :update, :destroy], path: 'measurements'
  get 'input', to: 'data_groups#input', as: :input
  post 'save_input', to: 'data_groups#save_input', as: :save_input
  root "data_groups#input"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
