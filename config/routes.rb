Rails.application.routes.draw do
  get 'items', to: 'items#index'
  root to: 'items#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
