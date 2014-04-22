Rails.application.routes.draw do
  resources :blogs
  root "blogs#new"
end
