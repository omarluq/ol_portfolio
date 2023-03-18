# frozen_string_literal: true

module Ui
  module Modal
    class PopUpComponent < BaseComponent
      def initialize
        @hidden = true
      end

      def open
        @hidden = false
      end

      def close
        @hidden = true
      end
      attr_reader :hidden
    end
  end
end
