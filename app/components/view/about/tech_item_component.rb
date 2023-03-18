# frozen_string_literal: true

module View
  module About
    class TechItemComponent < ApplicationComponent
      def initialize(title:, svg:)
        @title = title
        @svg = "#{svg}.svg"
      end
    end
  end
end
