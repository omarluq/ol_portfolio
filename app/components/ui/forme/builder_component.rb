# frozen_string_literal: true

module Ui
  module Forme
    class BuilderComponent < ApplicationComponent
      def initialize(obj: nil, **form_opts)
        @namespace = (obj.class.name.underscore || namespace).to_s
        @obj = obj
        @form_obj = ::Forme::Form.new(obj, { labeler: :span })
        @data = form_opts.delete(:data) || {}
        @form_opts = form_opts.merge(format_data)
        @open_form_tag = @form_obj.open(@form_opts).html_safe
        @close_form_tag = @form_obj.close.html_safe
        @current_namespace_count = {}
      end

      def open_self
        @open_form_tag
      end

      def close_self
        @close_form_tag
      end

      def before_render
        @protect_against_forgery = @form_obj.tag(:input, type: :hidden, name: request_forgery_protection_token, value: form_authenticity_token).html_safe
      end

      def input(type, field, label: nil, **opts)
        input_label = label || field.to_s.humanize
        opts = opts.merge(name: "#{@namespacing || @namespace}[#{field}]")
        opts = opts.merge(id: "#{@nested_input_id}_#{field}", value: @obj.instance_eval("#{@value_query}.#{field}", __FILE__, __LINE__)) if @nested
        case type
        when :toggle
          component('ui/forme/fields/toggle', locals: { form_obj: @form_obj, field:, label: input_label, opts: })
        else
          @form_obj.tag(:div, class: 'flex flex-col m-2 p-2') do
            @form_obj.input(field, type:, label: input_label, **opts)
          end.html_safe
        end
      end

      def submit(label = 'Submit', **opts)
        @form_obj.button(**opts.merge(value: label)).html_safe
      end

      def nested_fields(namespace, &block)
        @nested = true
        @multiple = plural?(namespace)
        @namespaces = @namespaces.blank? ? [namespace] : @namespaces << namespace
        @namespacing = [@namespace] + @namespaces.map { |ns| @multiple ? "[#{ns}][]" : "[#{ns}]" }
        @namespacing = @namespacing.flatten.join
        @nested_input_id = @namespacing.gsub('[]', '').gsub('[', '_').gsub(']', '')
        (@current_namespace_count[@namespacing] ? @current_namespace_count[@namespacing] += 1 : @current_namespace_count[@namespacing] = 0) if @multiple
        @value_query = @nested_input_id.gsub("#{@namespace}_", '').gsub(/_/, '.').gsub(/\[\]/, '')
        @value_query = @value_query.split('.').map { |meth| plural?(meth) ? "#{meth}[#{@current_namespace_count[@namespacing]}]" : meth }.join('.')
        block = block.call
        namespace_to_remove = "[#{@namespaces.pop}][]["
        @current_namespace_count.each_key { |key| @current_namespace_count.delete(key) if key.include?(namespace_to_remove) }
        block
      end

      def better_nested_fields(namespace)
        # TODO: switch to using reflect_on_association to confirm that the namespace is a valid association and weather it is a has_many or has_one
        raise 'Only works for active record models' unless @obj.is_a?(ActiveRecord::Base)

        @parent_model = @obj.class
        @association = @parent_model.reflect_on_all_associations.select { |a| a.name == namespace }
        @child_model = @association.klass
      end

      def plural?(namespace)
        namespace.to_s.pluralize == namespace.to_s && namespace.to_s.singularize != namespace.to_s
      end

      def format_data
        @data.transform_keys { |key| "data-#{key}" }
      end

      def collection_key
        SecureRandom.hex(16)
      end
    end
  end
end
