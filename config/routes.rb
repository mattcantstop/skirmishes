Skirmishes::Application.routes.draw do

  namespace :api, path: '/' do
    namespace :v1, path: '/' do
      resources :users do
        resources :wars
      end
    end
  end

  post "/signin", to: "sessions#create"

end
