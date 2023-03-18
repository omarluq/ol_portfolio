# frozen_string_literal: true

module View
  module Alerts
    class BaseComponentPreview < ViewComponent::Preview
      def default
        render(View::Alerts::BaseComponent.new)
      end
    end
  end
end
