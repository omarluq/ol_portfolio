# frozen_string_literal: true

module View
  module Alerts
    class BaseComponent < ApplicationComponent
      def initialize
        @uni_id = SecureRandom.hex(16)
      end
    end
  end
end
