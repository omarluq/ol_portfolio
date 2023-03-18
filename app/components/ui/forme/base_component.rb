# frozen_string_literal: true

module Ui
  module Forme
    class BaseComponent < ApplicationComponent
      attr_accessor :form

      def before_render
        @form = Ui::Forme::BuilderComponent.new(obj: @form_opts.delete(:model), **@form_opts)
      end

      def forme_form
        render form do
          yield(form).html_safe
        end
      end

      def call
        component_controller
      end
    end
  end
end
