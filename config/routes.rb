Rails.application.routes.draw do
    devise_for :marchants
    devise_for :users do
        get '/users/sign_out' => 'devise/sessions#destroy'
    end
    root 'dashboard#index'
    resources :transactions
    post '/verify_payment' => 'transactions#verify_payment'
    resources :dashboard, only: [:index]
 	resources :marchant_users
  	resources :users
  	resources :theaters do 
        resources :movies do 
            get :book_now
        end
    end
    resources :movies, only: [:show] do
        get :add_picture
        get :info
        resources :pictures
    end
       
end
