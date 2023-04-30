# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'incidents#index'
  resources :incidents, only: %i[index create show update]
end
