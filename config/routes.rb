Rails.application.routes.draw do
  get '/health_check', to: proc { [200, {}, ['success']] }

  namespace :api do
    namespace :v1 do
      post    'login',  to: 'sessions#create'
      post    'signup', to: 'registrations#create'

      resources :sources, only: :index
    end
  end
end
