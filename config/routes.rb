Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  resources :users do
    resources :runs
  end
end

# Prefix                   Verb   URI Pattern                             Controller#Action
# new_user_session         GET    /users/sign_in(.:format)                devise/sessions#new
# user_session             POST   /users/sign_in(.:format)                devise/sessions#create
# destroy_user_session     DELETE /users/sign_out(.:format)               devise/sessions#destroy
# user_password            POST   /users/password(.:format)               devise/passwords#create
# new_user_password        GET    /users/password/new(.:format)           devise/passwords#new
# edit_user_password       GET    /users/password/edit(.:format)          devise/passwords#edit
#                          PATCH  /users/password(.:format)               devise/passwords#update
#                          PUT    /users/password(.:format)               devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                 devise/registrations#cancel
# user_registration        POST   /users(.:format)                        devise/registrations#create
# new_user_registration    GET    /users/sign_up(.:format)                devise/registrations#new
# edit_user_registration   GET    /users/edit(.:format)                   devise/registrations#edit
#                          PATCH  /users(.:format)                        devise/registrations#update
#                          PUT    /users(.:format)                        devise/registrations#update
#                          DELETE /users(.:format)                        devise/registrations#destroy
#   root                   GET    /                                       users#index
# user_runs                GET    /users/:user_id/runs(.:format)          runs#index
#                          POST   /users/:user_id/runs(.:format)          runs#create
# new_user_run             GET    /users/:user_id/runs/new(.:format)      runs#new
# edit_user_run            GET    /users/:user_id/runs/:id/edit(.:format) runs#edit
# user_run                 GET    /users/:user_id/runs/:id(.:format)      runs#show
#                          PATCH  /users/:user_id/runs/:id(.:format)      runs#update
#                          PUT    /users/:user_id/runs/:id(.:format)      runs#update
#                          DELETE /users/:user_id/runs/:id(.:format)      runs#destroy
