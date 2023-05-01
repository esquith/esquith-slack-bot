# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'incidents#index'

  post '/slack/command' => 'slack#command'
  post '/slack/resolve' => 'slack#resolve'
  post '/slack/declare' => 'slack#declare'

  resources :incidents, only: %i[index create show update]
end
