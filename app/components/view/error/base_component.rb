# frozen_string_literal: true

module View
  module Error
    class BaseComponent < ApplicationComponent
      def initialize(error:)
        @error = error
        @uni_id = SecureRandom.hex(16)
      end
    end
  end
end
