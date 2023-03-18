# frozen_string_literal: true

module Ui
  module Form
    module Field
      class ParagraphComponent < ApplicationComponent
        TYPES = { text_area: :text_area, rich_text_area: :rich_text_area }.freeze
        def initialize(form:, field:, label: false, type: :text_area, autofocus: false, autocomplete: false, placeholder: false, caption: false, rows: 10, disabled: false, required: false, optional: false, value: nil, classes: '', data: {})
          @form = form
          @field = field
          @label = label || field
          @field_type = TYPES[type] || TYPES[:text_area]
          @autofocus = autofocus
          @autocomplete = autocomplete
          @placeholder = placeholder || field
          @caption = caption
          @rows = rows
          @disabled = disabled
          @required = required
          @optional = optional
          @value = value
          @classes = classes
          @data = data
        end
      end
    end
  end
end
