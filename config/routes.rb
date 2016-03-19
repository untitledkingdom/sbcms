# == Route Map
#
#           Prefix Verb   URI Pattern                                            Controller#Action
#              api GET    /api/beacons/:unique_identifier(.:format)              api/beacons#show
#                  GET    /api/beacons/:unique_identifier/events(.:format)       api/events#index
# api_beacon_event GET    /api/beacons/:unique_identifier/events/:kind(.:format) api/events#show
#      api_beacons GET    /api/beacons(.:format)                                 api/beacons#index
#    fetch_beacons POST   /beacons/fetch(.:format)                               beacons#fetch
#          beacons GET    /beacons(.:format)                                     beacons#index
#                  POST   /beacons(.:format)                                     beacons#create
#       new_beacon GET    /beacons/new(.:format)                                 beacons#new
#      edit_beacon GET    /beacons/:id/edit(.:format)                            beacons#edit
#           beacon GET    /beacons/:id(.:format)                                 beacons#show
#                  PATCH  /beacons/:id(.:format)                                 beacons#update
#                  PUT    /beacons/:id(.:format)                                 beacons#update
#                  DELETE /beacons/:id(.:format)                                 beacons#destroy
#            event PATCH  /events/:id(.:format)                                  events#update
#                  PUT    /events/:id(.:format)                                  events#update
#    edit_settings GET    /settings/edit(.:format)                               settings#edit
#                  POST   /settings/edit(.:format)                               settings#update
#         settings POST   /settings(.:format)                                    settings#create
#      new_setting GET    /settings/new(.:format)                                settings#new
#         sessions POST   /sessions(.:format)                                    sessions#create
#      new_session GET    /sessions/new(.:format)                                sessions#new
#             root GET    /                                                      dashboard#index
#

Rails.application.routes.draw do
  namespace :api do
    scope :beacons do
      get ':unique_identifier'               => 'beacons#show'
      get ':unique_identifier/events'        => 'events#index'
      get ':unique_identifier/events/:kind'  => 'events#show',   as: :beacon_event
    end
    get 'beacons' => 'beacons#index'
  end
  resources :beacons do
    collection do
      post 'fetch' => 'beacons#fetch'
    end
  end
  resources :events,    only: :update
  resources :settings,  only: [:new, :create] do
    collection do
      get   'edit' => 'settings#edit'
      post  'edit' => 'settings#update'
    end
  end
  resources :sessions,  only: [:new, :create]
  root to: 'dashboard#index'
end
