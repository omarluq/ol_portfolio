# frozen_string_literal: true

module Ui
  module Form
    module Field
      class SelectComponent < ApplicationComponent
        def initialize(form:, field:, label: false, collection: [], include_blank: true, multiple: false, caption: false, disabled: false, selected: nil, data: {})
          @form = form
          @field = field
          @label = label || field
          @selected = selected
          @collection = options_for_select(collection, @selected)
          @include_blank = include_blank
          @data = data
          @caption = caption
          @disabled = disabled
          @multiple = multiple
          @multiple_class = multiple ? 'multiselect' : ''
        end
      end
    end
  end
end
