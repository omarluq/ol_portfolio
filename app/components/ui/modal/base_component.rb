# frozen_string_literal: true

module Ui
  module Modal
    class BaseComponent < ApplicationComponent
      renders_one :trigger, -> { Ui::Wrapper::TriggerComponent.new(data: reflex_data_attributes(:open)) }
      renders_one :cancel_action, -> { component('ui/link/button', locals: { label: 'Close', size: :sm, data: reflex_data_attributes(:close) }) }
      renders_many :actions, lambda { |concat_reflex: true, **system_arguments|
        close_action = reflex_data_attributes(:close)
        if concat_reflex
          system_arguments[:data][:reflex] = "#{system_arguments[:data][:reflex]} #{close_action[:reflex]}"
          system_arguments[:data][:key] = close_action[:key]
        else
          system_arguments[:data] = close_action
        end
        component 'ui/link/button', locals: { **system_arguments }
      }
      renders_one :form_submit_action, lambda { |**system_arguments|
        component('ui/form/field/button', locals: { **system_arguments, data: reflex_data_attributes(:close) })
      }

      def collection_key
        SecureRandom.hex(16)
      end

      def close_icon
        tag.div(id: 'close-icon', class: 'text-slate-400 cursor-pointer absolute top-0 right-0 hidden pt-4 pr-6 sm:block', data: reflex_data_attributes(:close)) do
          tag.span(class: 'sr-only') { 'Close' } +
            component('ui/icon', locals: { name: 'x-mark', classes: 'transition ease-in-out delay-150 hover:-translate-y-1 hover:scale-110 hover:text-slate-700 duration-300 hover:cursor-pointer text-slate-500' })
        end
      end
    end
  end
end
