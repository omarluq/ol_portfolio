# frozen_string_literal: true

module Ui
  module Table
    class ContainerComponent < ApplicationComponent
      renders_many :rows, ->(**system_args) { Ui::Table::RowComponent.new(**system_args.merge(columns: @columns)) }
      renders_one :header, ->(**system_args) { Ui::Table::HeaderComponent.new(**system_args) }
      renders_one :footer, ->(**system_args) { Ui::Table::FooterComponent.new(**system_args) }

      def initialize(columns: [], classes: '', remove_actions: false)
        @columns = columns
        @classes = classes
        @remove_actions = remove_actions
      end
    end
  end
end
