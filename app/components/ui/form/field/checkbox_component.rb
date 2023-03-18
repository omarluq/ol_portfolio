# frozen_string_literal: true

module Ui
  module Form
    module Field
      class CheckboxComponent < ApplicationComponent
        TYPES = { inline: :inline, list: :list }.freeze

        def initialize(form:, field:, label: false, description: '', type: :inline, disabled: false, classes: '', _id: '', data: {})
          @form = form
          @field = field
          @label = label || field
          @description = description
          @checkbox_type = TYPES[type] || TYPES[:inline]
          @disabled = disabled
          @classes = classes
          @direction = @checkbox_type == :inline ? 'flex flex-row ' : ''
          @spacing = @checkbox_type == :inline ? 'ml-1' : ''
          @id = _id
          @data = data
        end
      end
    end
  end
end
