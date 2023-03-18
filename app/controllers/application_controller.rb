# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include CableReady::Broadcaster
  include Pagy::Backend
  include ApplicationHelper

  protect_from_forgery with: :exception
end
