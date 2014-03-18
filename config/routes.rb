Skirmishes::Application.routes.draw do

  namespace :api, path: '/' do
    namespace :v1, path: '/' do
      post '/signin', to: 'sessions#create'
      post '/signout', to: 'sessions#destroy'
      resources :users do
        resources :wars
      end
      resources :wars do
        post '/join/:user_id', to: 'wars#join'
        resources :battles
      end
    end
  end


end
