# frozen_string_literal: true

module Ui
  module Form
    module Field
      class ButtonComponent < ApplicationComponent
        def initialize(form:, label:, type:, size: :sm, disabled: false, loading_text: false, classes: '', _id: '', data: {})
          @form = form
          @label = label
          @type = type
          @size = if size == :lg
                    'w-full'
                  else
                    (size == :md ? 'w-1/3' : '')
                  end
          @disabled = disabled
          @loading_text = loading_text
          @classes = classes
          @id = _id
          @data = data
        end

        def call
          @form.button @label,
                       disabled: @disabled,
                       type: @type,
                       class: "btn inline-flex items-center justify-center whitespace-nowrap rounded-md border border-transparent bg-slate-500 bg-origin-border px-4 py-2 text-base font-medium text-tertiary shadow-sm hover:cursor-pointer #{disabled_effect} #{@size} #{@classes}",
                       id: @id,
                       data: @data.merge(@loading_text ? { reflex: 'focus->LoadButtonReflex#trigger', loading_text: @loading_text } : {})
        end
      end
    end
  end
end
