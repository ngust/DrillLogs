Rails.application.routes.draw do
 
  get 'samples/new'

  get 'samples/edit'

  get 'drill_logs/new'

  get 'drill_logs/create'

  get 'drill_logs/destroy'

 # resources :holes

 resources :holes do
    resources :drill_logs, only: [:new, :create]
    resources :samples , only: [:new, :create]
  end

 root to: 'holes#index'
 
end
