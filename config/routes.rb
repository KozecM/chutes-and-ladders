Rails.application.routes.draw do
  resources :games
  resources :players
  resources :spaces
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
