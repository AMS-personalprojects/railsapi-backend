Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :brands do
    get 'followers', on: :member
    resources :products 
  end
  
  resources :users do

    put 'follow'

    member do 
      get 'followers'
      get 'followings'
    end
    
    # resources :follow, :only => [:update]   
    
  end 

end



