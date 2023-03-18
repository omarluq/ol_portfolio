# frozen_string_literal: true

module Ui
  module Link
    class ButtonComponent < ApplicationComponent
      def initialize(label:, size: :sm, path: '#', method: :get, disabled: false, classes: '', _id: '', data: {}, icon: false, icon_position: :left)
        @label = label
        @size = if size == :lg
                  'w-full'
                else
                  (size == :md ? 'w-1/3' : '')
                end
        @path = path
        @method = method.to_s
        @disabled = disabled
        @classes = classes
        @id = _id
        @data = data
        @icon = icon
        @icon_position = icon_position
      end

      def icon_component
        component('ui/icon', locals: { name: @icon, size: :xsm, classes: icon_margin_class })
      end

      def icon_margin_class
        @icon_position == :left ? 'mr-1' : 'ml-1'
      end

      def format_button_label
        @icon ? label_with_icon.html_safe : @label
      end

      def label_with_icon
        @icon_position == :left ? "#{icon_component} #{@label}" : "#{@label} #{icon_component}"
      end

      def call
        link_to format_button_label,
                @path,
                method: @method,
                class: "#{disabled_effect} #{@size} inline-flex items-center justify-center whitespace-nowrap rounded-md border border-current bg-slate-500 px-4 py-2 text-base font-medium text-tertiary shadow-sm #{@classes} ",
                id: @id,
                data: @data
      end
    end
  end
end
