Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :nations
  resources :fixtures

  get 'results', to: 'fixtures#results'
end
