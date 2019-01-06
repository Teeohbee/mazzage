Rails.application.routes.draw do
  resources :guests, except: [:show]
  get 'pages/welcome'
  get 'pages/accomodation'
  get 'pages/faq'

  root 'pages#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
