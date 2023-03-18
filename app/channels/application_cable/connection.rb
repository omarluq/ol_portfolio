# frozen_string_literal: true

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    include ActionController::Cookies
    identified_by :current_user
    identified_by :session_id

    def connect
      self.session_id = request.session.id
      # self.current_user = find_verified_user
      # logger.add_tags 'ActionCable', current_user&.id
      # reject_unauthorized_connection unless current_user || session_id
    end

    def find_verified_user
      if (current_user = env['warden'].user)
        current_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
