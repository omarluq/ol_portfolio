# frozen_string_literal: true

module Ui
  module Wrapper
    class TriggerComponent < ApplicationComponent
      def initialize(data: {})
        @data = data
      end

      def call
        tag.div class: 'max-w-fit', data: @data do
          content
        end
      end
    end
  end
end
