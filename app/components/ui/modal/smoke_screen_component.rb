# frozen_string_literal: true

module Ui
  module Modal
    class SmokeScreenComponent < ApplicationComponent
      def initialize(data:)
        @data = data
      end

      def call
        tag.div(id: 'modal-smoke-screen', class: 'shadow-xl bg-black-transparent animated fadeIn fixed inset-0 overflow-hidden flex items-center justify-center', style: 'z-index:9998', data: @data) do
          content
        end
      end
    end
  end
end
