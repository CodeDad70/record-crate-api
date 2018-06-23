Rails.application.routes.draw do
  namespace :api do
    resources :albums, except: :edit
    resources :artists, except: :edit 
  end
end
