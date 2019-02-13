Rails.application.routes.draw do
  resources :guests, except: [:show, :index]
  get 'guests/backoffice'
  get 'pages/welcome'
  get 'pages/accommodation'
  get 'pages/faq'
  get 'pages/gallery'

  root 'pages#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
