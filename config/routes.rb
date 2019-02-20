Rails.application.routes.draw do
  resources :boards, defaults: {format: :json}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'authentication#authenticate', defaults: {format: :json}
end
