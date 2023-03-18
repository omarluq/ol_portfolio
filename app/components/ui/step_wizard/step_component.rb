# frozen_string_literal: true

module Ui
  module StepWizard
    class StepComponent < ApplicationComponent
      attr_accessor :title, :description

      def initialize(index:, title: nil, description: nil)
        @index = index
        @title = title
        @description = description
      end

      def initial_visbility
        @index == 1 ? '' : 'hidden'
      end

      def call
        tag.div(class: initial_visbility.to_s, id: "step_wizard_step_#{@index}") do
          content
        end
      end

      def collection_key
        SecureRandom.hex(16)
      end
    end
  end
end
