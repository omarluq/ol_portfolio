# frozen_string_literal: true

module View
  module Contact
    class BaseComponentPreview < ViewComponent::Preview
      def default
        render(View::Contact::BaseComponent.new)
      end
    end
  end
end
