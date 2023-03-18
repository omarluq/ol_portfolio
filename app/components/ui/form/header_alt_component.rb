# frozen_string_literal: true

module Ui
  module Form
    class HeaderAltComponent < ApplicationComponent
      def initialize(heading:, supporting_text: nil)
        @heading = heading
        @supporting_text = supporting_text
      end
    end
  end
end
