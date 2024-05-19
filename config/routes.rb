Rails.application.routes.draw do
  root 'reservations#index'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :users
  get 'users/:id/profile', to: 'users#profile', as: 'user_profile'

  resources :rooms do
    collection do
      get 'result'
      get 'result2'
    end

    resources :reservations do
      member do
        get :confirm
      end
    end
  end

  resources :reservations do
    collection do
      post :confirm
    end
  end
end

 