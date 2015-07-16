Rails.application.routes.draw do
  root 'palettes#index'
  
  resources :palettes

end
