# frozen_string_literal: true

module Ui
  module Form
    module Field
      class ToggleComponent < ApplicationComponent
        TYPES = { inline: :inline, list: :list }.freeze

        def initialize(field:, form: '', label: false, description: '', type: :inline, disabled: false, value: nil, classes: '', _id: '', data: {}, icons: { on: 'check', off: 'x-mark' })
          @form = form
          @field = field
          @label = label || field
          @description = description
          @type = type
          @disabled = disabled
          @value = value
          @classes = classes
          @id = _id
          @data = data
          @icons = icons
          @on = value
        end

        def icon
          return unless @icons

          name = @on ? @icons[:on] : @icons[:off]
          icon_class = @on ? 'text-slate-600' : 'text-slate-400'
          component('ui/icon', locals: { name:, size: :xxsm, classes: icon_class })
        end

        def bg
          @on ? 'bg-slate-600' : 'bg-slate-200'
        end

        def effect
          @on ? 'ease-out duration-100' : 'ease-in duration-200'
        end

        def translate
          @on ? 'translate-x-5' : 'translate-x-0'
        end

        # * required for components that gets rendered multiple times on the same page for the reflexes to locate the correct target
        def collection_key
          SecureRandom.hex(16)
        end

        def toggle_on
          @on = !@on
        end
      end
    end
  end
end
