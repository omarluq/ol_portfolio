# frozen_string_literal: true

module Ui
  module Form
    class HeaderComponent < ApplicationComponent
      def initialize(title:, description: false)
        @title = title
        @description = description
      end
    end
  end
end
