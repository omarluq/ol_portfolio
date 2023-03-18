# frozen_string_literal: true

module Ui
  module Form
    module Field
      class FileUploadComponent < ApplicationComponent
        def initialize(model:, label: '', autofocus: false, size: :sm, disabled: false, value: nil, classes: '', edit: false, data: {})
          @model = model
          @label = label
          @autofocus = autofocus
          @size = size
          @disabled = disabled
          @value = value
          @classes = classes
          @edit = edit
          @data = data
        end
      end
    end
  end
end
