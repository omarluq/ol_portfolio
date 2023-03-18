# frozen_string_literal: true

module Ui
  module Dropdown
    class ItemComponent < ApplicationComponent
      renders_one :icon, ->(**system_args) { Ui::IconComponent.new(**system_args) }
      # renders_one :icon,  Ui::IconComponent

      def initialize(label:, path: '#', method: :get, disabled: false, target: '', classes: '', icon: false, use_assets_icons: false, data: {})
        @label = label
        @path = path
        @method = method
        @disabled = disabled
        @target = target
        @classes = classes
        @data = data
        @role = 'menuitem'
        @icon = icon
        @use_assets_icons = use_assets_icons
      end

      def render_icon
        return unless @icon

        component('ui/icon', locals: { name: @icon, size: :xxsm, use_assets_icons: @use_assets_icons })
      end

      def align_label_with_icon
        icon? || @icon ? 'pl-2' : ''
      end

      def call
        link_to @path,
                method: @method,
                disabled: @disabled,
                target: @target,
                class: 'w-full block text-sm text-slate-700 hover:bg-slate-200 transition ease-in-out duration-200 whitespace-nowrap pr-3',
                role: @role,
                data: @data.merge(turbo: false) do
                  tag.div(class: 'flex flex-row') do
                    tag.div(class: 'flex items-center pl-3') do
                      if icon? && !@icon
                        content do
                          icon
                        end
                      else
                        render_icon
                      end
                    end +
                      tag.p(@label, class: "#{align_label_with_icon} text-slate-700 group flex items-center py-1 text-sm")
                  end
                end
      end
    end
  end
end
