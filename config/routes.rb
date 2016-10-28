Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'cards/admin', to: 'cards#admin'
  get 'cards/:year/:month/:day', to: 'cards#date'
  get 'cards/today', to: 'cards#today'

  resources :cards

  root 'cards#index'
end
