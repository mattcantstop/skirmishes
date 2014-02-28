Skirmishes::Application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :wars
      end
    end
  end

end
