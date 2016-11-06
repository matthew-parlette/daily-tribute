Rails.application.routes.draw do
  devise_for :users

  get 'cards/admin', to: 'cards#admin'
  get 'cards/:year/:month/:day', to: 'cards#date'
  get 'cards/today', to: 'cards#today'

  resources :cards

  root to: 'cards#index'
end
