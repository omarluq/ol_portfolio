# frozen_string_literal: true

## Example (email field with envelope icon):
# <%= component 'ui/form/field/single_text', locals: { form: @form, type: :email, field: :email, classes: 'pl-10', is_required: true } do |email_field| %>
#   <%= email_field.with_inner_icon_left(name: 'icon_envelope', size: 'xsm', use_assets_icons: true) %>
# <% end %>

module Ui
  module Form
    module Field
      class SingleTextComponent < ApplicationComponent
        TYPES = { text: :text, email: :email, password: :password }.freeze

        renders_many :inner_icons, types: {
          left: ->(**system_arguments) { icon('left', **system_arguments) },
          right: ->(**system_arguments) { icon('right', **system_arguments) }
        }

        def initialize(form:, field:, label: nil, type: :text, autofocus: false, autocomplete: false, placeholder: nil, caption: false, disabled: false, required: false, optional: false, value: nil, is_parsed_data: false, classes: '', data: {})
          @form = form
          @field = field
          @label = label || field.to_s.humanize.titleize
          @field_type = "#{TYPES[type]}_field".to_sym || "#{TYPES[:text]}_field".to_sym
          @autofocus = autofocus
          @autocomplete = autocomplete
          @placeholder = placeholder
          @caption = caption
          @disabled = disabled
          @required = required
          @optional = optional
          @value = value
          @classes = classes
          @is_parsed_data = is_parsed_data
          @data = data
        end

        def icon(position, **system_arguments)
          tag.div class: "pointer-events-none absolute inset-y-0 #{position}-0 flex items-center px-3" do
            component('ui/icon', locals: { **system_arguments })
          end
        end
      end
    end
  end
end
