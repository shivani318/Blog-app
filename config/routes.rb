Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :profiles, except: [:index]
    # collection do
    #   get 'states'
    # end
  # end

  resources :blogs
  root 'home#index'
  # get 'cities/:state', to: 'application#cities'

  resources :cities, only: :index
  resources :states, only: :index
end
