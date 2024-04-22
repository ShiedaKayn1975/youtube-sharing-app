Rails.application.routes.draw do
  get '/health_check', to: proc { [200, {}, ['success']] }
  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    namespace :v1 do
      post    'login',  to: 'sessions#create'
      post    'signup', to: 'registrations#create'
      get     'me',     to: 'sessions#me'

      resources :video_sharings

      mount ActionCable.server => '/cable/:id'
    end
  end
end
