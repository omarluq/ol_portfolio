# frozen_string_literal: true

module Ui
  module Dropdown
    class SectionComponent < ApplicationComponent
      renders_many :items, lambda { |as_popup_modal: false, **system_arguments|
        if as_popup_modal
          Shared::ModalComponent.new(**system_arguments.merge({ trigger: :drop_down_link }))
        else
          Ui::Dropdown::ItemComponent.new(**system_arguments)
        end
      }

      def initialize(label: false, description: false, classes: '')
        @label = label
        @description = description
        @classes = classes
      end
    end
  end
end
