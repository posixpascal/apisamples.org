Rails.application.routes.draw do
  get 'providers/index'

  get 'providers/show'

  namespace :providers do
    get 'examples/index'
  end

  namespace :providers do
    get 'examples/show'
  end

  get '/search', to: 'search#index'

  resources :providers do
    resources :examples, only: [:show, :index]
  end

  root to: "home#index"
end
