Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :events do
    collection do
       get 'my', to: 'events#my', as: :my
    end
    resources :event_sections do
      resources :proposals, only: [:new, :create] do
        resources :ratings, only: [:create]
      end
    end
  end

  #get 'events', to: 'events#index', as: :events
  get 'contact', to: 'home#contact', as: :contact
end
