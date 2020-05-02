Rails.application.routes.draw do
  resources :data_groups
  resources :measurement_data
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
