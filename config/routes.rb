Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  
  root 'artikels#index'
  
  resources :artikels
  resources :games do
    collection do
      get 'search'
    end
  end
  resources :user do
    resources :own, :path => "gamecollectie"
    resources :wishlist
  end
    
  
 


end
