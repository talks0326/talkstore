# == Route Map
#
#                           Prefix Verb       URI Pattern                             Controller#Action
#                  admin_dashboard GET        /admin/dashboard/index(.:format)        admin/dashboard#index
#             admin_dashboard_show GET        /admin/dashboard/show(.:format)         admin/dashboard#show
#                      admin_users GET        /admin/users/index(.:format)            admin/users#index
#                       admin_user GET        /admin/users/:id(.:format)              admin/users#show
#                admin_become_user GET        /admin/users/:id/become(.:format)       admin/users#become
#                    pages_privacy GET        /pages/privacy(.:format)                pages#privacy
#                      time_keeper GET        /time_keeper/:id(.:format)              time_keeper#show
#                         time_end POST       /time_keeper/:id/time_end(.:format)     time_keeper#time_end
#                     time_end_get GET        /time_keeper/:id/time_end(.:format)     time_keeper#time_end
#                         location GET        /locations/:id(.:format)                locations#show
#                 location_current POST       /locations/:id/current(.:format)        locations#current
#                location_check_in GET        /locations/:id/check_in(.:format)       locations#check_in
#              location_checked_in GET        /locations/:id/checked_in(.:format)     locations#checked_in
#                     message_room GET        /messages/:id(.:format)                 messages#show
#                    messages_post POST       /messages/:id/post(.:format)            messages#post
#                    recruit_index GET        /recruit/index(.:format)                recruit#index
#                     recruit_show GET        /recruit/:id(.:format)                  recruit#show
#                   recruit_choose GET        /recruit/:id/choose(.:format)           recruit#choose
#                      apply_index GET        /apply/index(.:format)                  apply#index
#                  apply_mattching GET        /apply/mattching(.:format)              apply#mattching
#                       apply_show GET        /apply/:id(.:format)                    apply#show
#                      apply_offer GET        /apply/:id/offer(.:format)              apply#offer
#                             root GET        /                                       top#index
#                        top_index GET        /top/index(.:format)                    top#index
#                 new_user_session GET        /users/sign_in(.:format)                devise/sessions#new
#                     user_session POST       /users/sign_in(.:format)                devise/sessions#create
#             destroy_user_session DELETE     /users/sign_out(.:format)               devise/sessions#destroy
# user_facebook_omniauth_authorize GET|POST   /users/auth/facebook(.:format)          users/omniauth_callbacks#passthru
#  user_facebook_omniauth_callback GET|POST   /users/auth/facebook/callback(.:format) users/omniauth_callbacks#facebook
#                new_user_password GET        /users/password/new(.:format)           devise/passwords#new
#               edit_user_password GET        /users/password/edit(.:format)          devise/passwords#edit
#                    user_password PATCH      /users/password(.:format)               devise/passwords#update
#                                  PUT        /users/password(.:format)               devise/passwords#update
#                                  POST       /users/password(.:format)               devise/passwords#create
#         cancel_user_registration GET        /users/cancel(.:format)                 devise/registrations#cancel
#            new_user_registration GET        /users/sign_up(.:format)                devise/registrations#new
#           edit_user_registration GET        /users/edit(.:format)                   devise/registrations#edit
#                user_registration PATCH      /users(.:format)                        devise/registrations#update
#                                  PUT        /users(.:format)                        devise/registrations#update
#                                  DELETE     /users(.:format)                        devise/registrations#destroy
#                                  POST       /users(.:format)                        devise/registrations#create
#                         sign_out GET        /sign_out(.:format)                     devise/sessions#destroy
#                     profile_edit GET        /profiles/edit(.:format)                profiles#edit
#                          profile GET        /profiles(.:format)                     profiles#show
#                  profiles_update PATCH      /profiles/update(.:format)              profiles#update
#                       new_review GET        /review/:ticket_id/new(.:format)        reviews#new
#                    create_review POST       /review/:ticket_id/create(.:format)     reviews#create
#             today_ticket_tickets GET        /tickets/today_ticket(.:format)         tickets#today_ticket
#                          tickets GET        /tickets(.:format)                      tickets#index
#                                  POST       /tickets(.:format)                      tickets#create
#                       new_ticket GET        /tickets/new(.:format)                  tickets#new
#                      edit_ticket GET        /tickets/:id/edit(.:format)             tickets#edit
#                           ticket GET        /tickets/:id(.:format)                  tickets#show
#                                  PATCH      /tickets/:id(.:format)                  tickets#update
#                                  PUT        /tickets/:id(.:format)                  tickets#update
#                                  DELETE     /tickets/:id(.:format)                  tickets#destroy
#                     user_tickets POST|PATCH /user_tickets(.:format)                 tickets#user_tickets
#                          privacy GET        /privacy(.:format)                      pages#privacy
# 

Rails.application.routes.draw do
  namespace :admin do
    get 'dashboard/index' => "dashboard#index",as: "dashboard"
    get 'dashboard/show'
    get 'users/index' => "users#index",as: "users"
    get 'users/:id' => "users#show",as: "user"
    get "users/:id/become" => "users#become",as: "become_user"
  end

  get 'pages/privacy'

  get 'time_keeper/:id' => "time_keeper#show",as: "time_keeper"
  post 'time_keeper/:id/time_end' => "time_keeper#time_end",as: "time_end"
  get 'time_keeper/:id/time_end' => "time_keeper#time_end",as: "time_end_get"

  get 'locations/:id' => "locations#show",as: "location"
  post 'locations/:id/current' => "locations#current",as: "location_current"
  #post 'locations/:id/check_in' => "locations#check_in",as: "location_check_in"
  get 'locations/:id/check_in' => "locations#check_in",as: "location_check_in"
  get 'locations/:id/checked_in' => "locations#checked_in",as: "location_checked_in"

  get 'messages/:id' => "messages#show",as: "message_room"
  post 'messages/:id/post' => "messages#post",as: "messages_post"

  get 'recruit/index'
  get 'recruit/:id' => "recruit#show",as: "recruit_show"
  get 'recruit/:id/choose' => "recruit#choose",as: "recruit_choose"
  
  get 'apply/index'
  get 'apply/mattching' => "apply#mattching",as: "apply_mattching"
  get 'apply/:id' => "apply#show",as: "apply_show"
  get 'apply/:id/offer' => "apply#offer",as: "apply_offer"


  root to: "top#index"
  get 'top/index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' } 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "profiles/edit" => "profiles#edit",as: "profile_edit"
  get "profiles" => "profiles#show",as: "profile"
  patch "profiles/update" => "profiles#update"

  get "review/:ticket_id/new" => "reviews#new",as: "new_review"
  post "review/:ticket_id/create" => "reviews#create",as: "create_review"
  resources :tickets do
    collection do
      get "today_ticket"
    end
  end
  match "user_tickets" => "tickets#user_tickets",as: "user_tickets", via: [:post, :patch]

  get "privacy" => "pages#privacy",as: "privacy"
end
