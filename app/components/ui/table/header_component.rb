# frozen_string_literal: true

module Ui
  module Table
    class HeaderComponent < ApplicationComponent
      renders_many :actions, ->(**system_args) { Ui::Link::ButtonComponent.new(**system_args.merge({ classes: 'rounded-none rounded-tr-md h-full border-slate-500', data: { turbo: false } })) }

      def initialize(title: false, description: false, icon: false, use_assets_icons: false, classes: '')
        @title = title
        @description = description
        @icon = icon
        @use_assets_icons = use_assets_icons
        @classes = classes
        @translate = '-translate-y-12 '
        @height = 'h-0'
        @invisible = 'invisible'
        @open = false
      end
    end
  end
end
