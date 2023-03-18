# frozen_string_literal: true

module View
  module Error
    class BaseComponentPreview < ViewComponent::Preview
      def default
        render(View::Error::BaseComponent.new)
      end
    end
  end
end
