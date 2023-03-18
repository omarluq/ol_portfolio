# frozen_string_literal: true

module Ui
  module Modal
    class SlideOutComponent < BaseComponent
      def initialize(callback: nil, c_key: nil)
        @callback = callback
        @c_key = c_key
      end

      def collection_key
        @c_key || SecureRandom.hex(16)
      end

      def open
        stimulate(@callback[:reflex].gsub('click->', ''), { key: @callback[:key] }) if @callback
        prevent_refresh!
        cable_ready.remove_css_class(selector: container_selector, name: 'invisible')
        cable_ready.remove_css_class(selector: body_selector, name: 'translate-x-full')
        cable_ready.inner_html(
          html: "<div data-key='#{element.dataset[:key]}' class='offcanvas-backdrop fade show' data-reflex='click->Ui::Modal::SlideOutComponent#close'></div>",
          selector: "[id='backdrop']"
        )
      end

      def close
        prevent_refresh!
        cable_ready.remove_css_class(selector: body_selector, name: 'translate-x-0')
        cable_ready.add_css_class(selector: body_selector, name: 'translate-x-full')
        cable_ready.add_css_class(selector: container_selector, name: 'invisible')
        cable_ready.inner_html(
          html: '',
          selector: "[id='backdrop']"
        )
      end

      def container_selector
        "[id='slideout_container_for_#{element.dataset[:key]}']"
      end

      def body_selector
        "[id='modal_body_for_#{element.dataset[:key]}']"
      end
    end
  end
end
