Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'uploads/upload'
  resources :uploads, only: %i[index]
end
