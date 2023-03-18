# frozen_string_literal: true

module Ui
  module Form
    module Field
      class RadioComponent < ApplicationComponent
        def initialize(form:, field:, label: false, type: :radio, required: false, optional: false, value: nil, classes: '', data: {})
          @form = form
          @field = field
          @label = label
          @field_type = type
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
