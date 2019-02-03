Rails.application.routes.draw do

  resources :items
  resources :charges
  resources :item, only: [:show ] do 
      resources :charges
  end
  root to: "items#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
