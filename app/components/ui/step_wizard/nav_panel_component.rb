# frozen_string_literal: true

module Ui
  module StepWizard
    class NavPanelComponent < ApplicationComponent
      # renders_many :nav_items, ->(**system_argument) { StepWizard::NavItemComponent.new(**system_argument) }

      def initialize(title: ' ', action: nil)
        @title = title
        @action = action
      end

      def action_button
        @action
      end
    end
  end
end
