Rails.application.routes.draw do
  get 'react/index'
  root 'react#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount API::API => '/'
end
