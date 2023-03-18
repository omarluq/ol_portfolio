# frozen_string_literal: true

module Ui
  module StepWizard
    class ContainerComponent < ApplicationComponent
      renders_many :steps, ->(**system_argument) { StepWizard::StepComponent.new(**system_argument) }
      renders_one :nav_panel, lambda { |**system_argument|
                                StepWizard::NavPanelComponent.new(**system_argument)
                              }

      def initialize(title: nil)
        @title = title
        # @callback = callback
      end

      def before_render
        @steps_array = steps.map { |step| { title: step.title, description: step.description } }
        @number_of_steps = steps.length
      end

      def next
        # stimulate(@callback[:reflex].gsub('click->', ''), { key: @callback[:key] }) if @callback

        prevent_refresh!
        return if element.dataset[:current_step].to_i == @number_of_steps.to_i

        cable_ready.add_css_class(selector: "[id='step_wizard_step_#{element.dataset[:current_step]}']", name: 'hidden')
        show_current_step(element.dataset[:current_step].to_i + 1)
        refresh_nav_items(element.dataset[:current_step].to_i + 1)
      end

      def previous
        prevent_refresh!
        return if element.dataset[:current_step].to_i <= 1

        cable_ready.add_css_class(selector: "[id='step_wizard_step_#{element.dataset[:current_step]}']", name: 'hidden')
        show_current_step(element.dataset[:current_step].to_i - 1)
        refresh_nav_items(element.dataset[:current_step].to_i - 1)
      end

      def set_as_current
        prevent_refresh!
        (1..@number_of_steps).each do |step|
          cable_ready.add_css_class(selector: "[id='step_wizard_step_#{step}']", name: 'hidden')
        end
        show_current_step(element.dataset[:step].to_i)
        refresh_nav_items(element.dataset[:step].to_i)
      end

      def show_current_step(step_number)
        cable_ready.remove_css_class(selector: "[id='step_wizard_step_#{step_number}']", name: 'hidden')
        cable_ready.set_dataset_property(selector: "[id='step_wizard_next_button']", name: 'currentStep', value: step_number)
        cable_ready.set_dataset_property(selector: "[id='step_wizard_previous_button']", name: 'currentStep', value: step_number)
      end

      # this function is triggered on initial render
      def nav_items
        nav_items_array = []
        steps.each_with_index do |step, step_index|
          step_number = step_index + 1
          case step_number
          when 1 then nav_items_array << component('ui/step_wizard/nav_item', locals: { title: step&.title, description: step&.description, data: reflex_data_attributes(:set_as_current).merge(step: step_number), variant: :current })
          when 2...@number_of_steps then nav_items_array << component('ui/step_wizard/nav_item', locals: { title: step&.title, description: step&.description, data: reflex_data_attributes(:set_as_current).merge(step: step_number), variant: :upcoming })
          when @number_of_steps then nav_items_array << component('ui/step_wizard/nav_item', locals: { title: step&.title, description: step&.description, data: reflex_data_attributes(:set_as_current).merge(step: step_number), variant: :upcoming, last_step: true })
          end
        end
        nav_items_array.join(' ').html_safe
      end

      # after every reflex the content of nav panel 'nav_items array' is rebuilt
      def refresh_nav_items(current_step_number)
        nav_items = []
        @steps_array.each_with_index do |step, step_index|
          step_number = step_index + 1
          last_step = step_number == @number_of_steps
          variant = :completed if step_number < current_step_number
          variant = :current if step_number == current_step_number
          variant = :upcoming if step_number > current_step_number
          nav_items << ApplicationController.render(Ui::StepWizard::NavItemComponent.new(title: step[:title], description: step[:description], data: reflex_data_attributes(:set_as_current).merge(step: step_number, key: element.dataset[:key]), variant:, last_step:), layout: false)
        end
        cable_ready.inner_html(selector: "[id='nav_panel_content']", html: nav_items.join(' ').html_safe)
      end
    end
  end
end
