# frozen_string_literal: true

module Ui
  module Forme
    module Fields
      class ToggleComponent < ApplicationComponent
        def initialize(form_obj:, field:, label:, opts:)
          @form_obj = form_obj
          @field = field
          @label = label
          @opts = opts
          @opts.merge!(class: '')
        end

        def collection_key
          SecureRandom.hex(16)
        end
      end
    end
  end
end
