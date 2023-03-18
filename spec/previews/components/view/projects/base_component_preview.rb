# frozen_string_literal: true

module View
  module Projects
    class BaseComponentPreview < ViewComponent::Preview
      def default
        render(View::Projects::BaseComponent.new)
      end
    end
  end
end
