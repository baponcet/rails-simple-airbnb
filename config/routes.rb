Rails.application.routes.draw do
  resources :flats

  get '/search', to: 'flats#search', as: 'search'
end
