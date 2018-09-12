Rails.application.routes.draw do
  require 'sidekiq/web'

  # sidekiqのダッシュボード設定
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == 'basicuser' && password == 'basicpass'
  end
  mount Sidekiq::Web => '/sidekiq'

  resources :snippets
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
