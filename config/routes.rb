Skirmishes::Application.routes.draw do

  namespace :api, path: '/' do
    namespace :v1, path: '/' do
      devise_for :users, path: '', path_names: { :signin => 'signin' }
      resources :users do
        resources :wars
      end
    end
  end

end
