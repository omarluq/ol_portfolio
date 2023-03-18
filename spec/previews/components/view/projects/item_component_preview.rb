# frozen_string_literal: true

module View
  module Projects
    class ItemComponentPreview < ViewComponent::Preview
      def default
        render(View::Projects::ItemComponent.new)
      end
    end
  end
end
