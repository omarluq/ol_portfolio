# frozen_string_literal: true

module Ui
  module Router
    class TriggerComponent < ApplicationComponent
      def initialize(collection:, view:, target:, **args)
        @collection = collection
        @view = view
        @target = target
        @component_klass = "#{@view.classify}Component".constantize
        @args = args
      end

      def open
        case @target
        when 'slider'
          cable_ready.add_css_class(selector: "[id='offcanvasRight']", name: 'show')
          cable_ready.set_attribute(name: 'style', value: 'visibility: visible;', selector: "[id='offcanvasRight']")
          cable_ready.inner_html(
            html: "<div class='offcanvas-backdrop fade show' data-reflex='click->Ui::Router::TriggerComponent#close'></div>",
            selector: "[id='backdrop']"
          )
          cable_ready.inner_html(
            html: ApplicationController.render(@component_klass.new(collection: @collection, **@args), layout: false),
            selector: "[id='offcanvas_content']"
          )
        when 'modal'
          cable_ready.add_css_class(selector: "[id='applicationModal']", name: 'show')
          cable_ready.remove_css_class(selector: "[id='applicationModal']", name: 'hidden')
          cable_ready.inner_html(
            html: "<div class='offcanvas-backdrop fade show' data-reflex='click->Ui::Router::TriggerComponent#close'></div>",
            selector: "[id='backdrop']"
          )
          cable_ready.inner_html(
            html: ApplicationController.render(@component_klass.new(collection: @collection, **@args), layout: false),
            selector: "[id='modal_content']"
          )
        else
          cable_ready.inner_html(
            html: ApplicationController.render(@component_klass.new(collection: @collection, **@args), layout: false),
            selector: "[id='#{@target}']"
          )
        end
        prevent_refresh!
      end

      def close
        cable_ready.remove_css_class(selector: "[id='offcanvasRight']", name: 'show')
        cable_ready.remove_css_class(selector: "[id='applicationModal']", name: 'show')
        cable_ready.add_css_class(selector: "[id='applicationModal']", name: 'hidden')
        cable_ready.inner_html(
          html: '',
          selector: "[id='backdrop']"
        )
        prevent_refresh!
      end
    end
  end
end
