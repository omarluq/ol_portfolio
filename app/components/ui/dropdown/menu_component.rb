# frozen_string_literal: true

module Ui
  module Dropdown
    class MenuComponent < ApplicationComponent
      renders_one :trigger, -> { Ui::Wrapper::TriggerComponent.new(data: reflex_data_attributes(:open).merge({ action: 'keydown->application-controller#stopProp' })) }
      renders_many :sections, ->(**system_arguments) { Ui::Dropdown::SectionComponent.new(**system_arguments) }

      def initialize(classes: '')
        @classes = classes
        @role = 'menu'
      end

      def collection_key
        SecureRandom.hex(16)
      end

      def open
        prevent_refresh!
        cable_ready.remove_css_class(selector: hidden_close_screen_key_selector, name: 'invisible')
        classes_to_remove = 'transition ease-out duration-300 translate-y-2 opacity-0 scale-95 invisible'.split(' ')
        classes_to_remove.each { |c| cable_ready.remove_css_class(selector: menu_key_selector, name: c) }
        classes_to_add = 'transition ease-in duration-600 translate-y-0 opacity-100 scale-100'.split(' ')
        classes_to_add.each { |c| cable_ready.add_css_class(selector: menu_key_selector, name: c) }
      end

      def close
        prevent_refresh!
        classes_to_remove = 'transition ease-in duration-600 translate-y-0 opacity-100 scale-100'.split(' ')
        classes_to_remove.each { |c| cable_ready.remove_css_class(selector: menu_key_selector, name: c) }
        classes_to_add = 'transition ease-out duration-300 translate-y-2 opacity-0 scale-95 invisible'.split(' ')
        classes_to_add.each { |c| cable_ready.add_css_class(selector: menu_key_selector, name: c) }
        cable_ready.add_css_class(selector: hidden_close_screen_key_selector, name: 'invisible')
      end

      def menu_key_selector
        "[id='menu_for_#{element.dataset[:key]}']"
      end

      def hidden_close_screen_key_selector
        "[id='hidden-close-button-for-active-dropdown-#{element.dataset[:key]}']"
      end
    end
  end
end
