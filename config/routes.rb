# frozen_string_literal: true

Rails.application.routes.draw do
  mount Lookbook::Engine, at: '/lookbook'

  scope controller: :static do
    get :about, to: 'static#root'
    get :projects, to: 'static#root'
    get :blog, to: 'static#root'
    get :contact, to: 'static#root'
  end

  root to: 'static#root'
end

# == Route Map
#
