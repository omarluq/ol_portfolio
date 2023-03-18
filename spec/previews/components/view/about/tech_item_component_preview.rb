# frozen_string_literal: true

module View
  module About
    class TechItemComponentPreview < ViewComponent::Preview
      def default
        render(View::About::TechItemComponent.new)
      end
    end
  end
end
