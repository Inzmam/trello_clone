Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :boards, defaults: {format: :json}

      # Users routes
      post 'sign_up', to: 'users#create'

      # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
      post 'login', to: 'authentication#authenticate', defaults: {format: :json}
    end
  end

end
