# frozen_string_literal: true

module Ui
  module Form
    module Field
      class PhoneComponent < ApplicationComponent
        def initialize(form:, label:, type: :text, autofocus: false, autocomplete: false, placeholder: false, caption: false, disabled: false, value: nil, classes: '', data: {})
          @form = form
          @label = label
          @field_type = "#{type}_field".to_sym
          @autofocus = autofocus
          @autocomplete = autocomplete
          @placeholder = placeholder || label
          @caption = caption
          @disabled = disabled
          @classes = classes
          @value = value
          @data = data
        end

        # Phone field should have 3 states and 2 formats
        # 1. Data Entry Admin / User Internal View
        # In this state the country_dropdown is visible and the phone_type is visible, when saved number is normalized to save_format
        #
        # 2. Data Entry User External View
        # In this state the country_dropdown is visible, when saved number is normalized to save_format
        #
        # 3. View mode Admin / User Internal View
        # In this state the phone number is displayed as in link_form in the display_format
        # link_form =  <a href="tel:+12149235555">+1 (214) 923-5555</a>
        #
        # display_format = plus_sign country_code space open_paren area_code close_paren space three_digit hyphen four_digit
        # +1 (214) 923-5555
        # save_format = plus_sign country_code area_code three_digit four_digit
        # +12149235555
        #
        # country_dropdown contains the country flag as an icon and aria as country code and defaults to usa
        # phone_type contains default list of phone types defined in lookups table allows users to select "Custom" to add their own label
      end
    end
  end
end
