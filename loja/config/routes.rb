Rails.application.routes.draw do
  
  resources :produtos, only:[:new,:create,:destroy]
  root "produtos#index"

end
