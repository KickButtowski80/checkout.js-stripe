Rails.application.routes.draw do

  get 'purchases/index'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :items
  resources :charges
  # resources :item, only: [:show ] do 
  #     resources :charges
  # end
  root to: "items#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
