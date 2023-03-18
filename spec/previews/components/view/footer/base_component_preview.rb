# frozen_string_literal: true

module View
  module Footer
    class BaseComponentPreview < ViewComponent::Preview
      def default
        render(View::Footer::BaseComponent.new)
      end
    end
  end
end
