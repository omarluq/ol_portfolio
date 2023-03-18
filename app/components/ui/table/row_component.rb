# frozen_string_literal: true

module Ui
  module Table
    class RowComponent < ApplicationComponent
      renders_one :actions_dropdown, ->(**system_args) { Ui::Dropdown::MenuComponent.new(**system_args) }

      def initialize(resource: nil, columns: [])
        @resource = resource
        @columns = columns
      end

      def collection_key
        SecureRandom.hex(16)
      end
    end
  end
end
