# frozen_string_literal: true

module View
  module Projects
    class ItemComponent < ApplicationComponent
      def initialize(name:, type:, des:, tags:, url:)
        @name = name
        @type = type
        @des = des
        @tags = tags
        @url = url
      end
    end
  end
end
