# frozen_string_literal: true

module View
  module Blog
    class BaseComponentPreview < ViewComponent::Preview
      def default
        render(View::Blog::BaseComponent.new)
      end
    end
  end
end
