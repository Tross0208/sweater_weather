Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/munchies', to: 'munchies#search'
      post '/users', to: 'users#create'
      post '/sessions', to: 'sessions#create'
    end
  end
end
