Rails.application.routes.draw do
  get 'profile/edit_profile'
  post 'profile/edit_profile'

  get 'password/reset_password'
  post 'password/reset_password'

  get 'password/forget_password'
  post 'password/forget_password'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "account#signup"
  
  get 'account/signup'
  post 'account/signup'

  get 'account/login'
  post 'account/login'

  get 'account/dashboard'
  # post 'account/dashboard'

  get 'account/edit_profile'
  post 'account/edit_profile'

  get 'account/logout'
  # resources :account
end
