# rubocop:disable Lint/ImplicitStringConcatenation
# frozen_string_literal: true

# all models has been deleted however im keeping this page as an example for the super form component I will be building

module View
  module Workflows
    class FactoryComponent < ApplicationComponent
      def initialize(workflow_template: nil)
        @used_ids = []
        @workflow_template = workflow_template || WorkflowTemplate.new(id: uni_random_id)
        new_step if @workflow_template.steps.empty?
        @available_drops ||= []
        @client ||= nil
      end

      def new_step
        @workflow_template.steps.new(id: uni_random_id)
      end

      def select_client
        @client = Client.includes(:teams).find(element.value)
      end

      def destroy_step
        step_id = element.dataset['step-id'].to_i
        @workflow_template.steps = @workflow_template.steps.reject { |step| step.id == step_id }
      end

      def uni_random_id
        loop do
          id = rand(1..100_000)
          unless @used_ids.include?(id)
            @used_ids << id
            break id
          end
        end
      end

      def add_transaction_fields
        prevent_refresh!
        cable_ready.append(
          selector: transactions_container_selector,
          html: transactions_input_fields
        )
      end

      def destroy_transaction
        prevent_refresh!
        cable_ready.remove(
          selector: transaction_selector
        )
      end

      def delete_button(data:, disabled: false)
        data = {} if disabled
        text_color = disabled ? 'text-slate-500' : ''
        hover = disabled ? 'hover:cursor-not-allowed' : 'hover:text-slate-300 hover:cursor-pointer hover:transition-colors'
        tag.div(class: "#{hover} #{text_color} flex justify-center items-center	", data:) do
          ApplicationController.render(Ui::IconComponent.new(name: 'trash', data:), layout: false)
        end
      end

      def steps_nested_fields(step, disable_delete: false)
        tag.div(id: "single-step-container-#{step.id}", class: 'relative p-5 flex flex-col gap-5 bg-black border-1 rounded-md border-black shadow-md  pl-6 mt-3') do
          tag.div(class: 'flex flex-col') do
            tag.h1(class: 'text-xl') { 'New Step' } +
              tag.p(class: 'text-sm text-slate-500') { 'Step Config' }
          end +
            tag.div(class: 'absolute top-0 right-0') do
              ApplicationController.render(Ui::Link::ButtonComponent.new(label: 'Action', icon: 'plus', data: reflex_data_attributes(:add_new_action).merge('step-id': step.id)), layout: false)
            end +
            tag.div(class: 'flex flex-col') do
              label('Step Name') +
                tag.div(class: 'flex flex-row gap-5 align-center') do
                  tag.input(name: 'workflow_template[steps][][name]', type: :text, id: "workflow_template_step_#{step.id}_name", class: 'w-full block appearance-none rounded-md border border-slate-300 px-3 py-2 placeholder-slate-400 shadow-sm focus:border-slate-500 focus:outline-none focus:ring-slate-500 sm:text-sm disabled:border-slate-200 disabled:bg-slate-50 disabled:text-slate-500', data: reflex_data_attributes('input->update_step_name').merge({ 'reflex-permanent': '', 'step-id': step.id })) +
                    delete_button(data: reflex_data_attributes(:destroy_step).merge('step-id': step.id), disabled: disable_delete)
                end
            end +
            tag.div(class: 'flex flex-col') do
              label('Auto Run') +
                tag.input(name: 'workflow_template[steps][][auto_run]', type: :checkbox, id: "workflow_template_step_#{step.id}_auto_run flexSwitchCheck", role: 'switch', class: 'mt-[0.3rem] mr-2 h-3.5 w-8 border-transparent appearance-none rounded-[0.4375rem] bg-secondar-300 outline-none before:pointer-events-none before:absolute before:h-3.5 before:w-3.5 before:rounded-full before:bg-transparent before:content-[''] after:absolute after:z-[2] after:-mt-[0.1875rem] after:h-5 after:w-5 after:rounded-full after:border-none after:bg-black after:shadow-[0_0px_3px_0_rgb(0_0_0_/_7%),_0_2px_2px_0_rgb(0_0_0_/_4%)] after:transition-[background-color_0.2s,transform_0.2s] after:content-[''] checked:bg-slate-500 checked:after:absolute checked:after:z-[2] checked:after:-mt-[3px] checked:after:ml-[1.0625rem] checked:after:h-5 checked:after:w-5 checked:after:rounded-full checked:after:border-none checked:after:bg-slate-500 checked:after:shadow-[0_3px_1px_-2px_rgba(0,0,0,0.2),_0_2px_2px_0_rgba(0,0,0,0.14),_0_1px_5px_0_rgba(0,0,0,0.12)] checked:after:transition-[background-color_0.2s,transform_0.2s] checked:after:content-[''] hover:cursor-pointer focus:before:scale-100 focus:before:opacity-[0.12] focus:before:shadow-[3px_-1px_0px_13px_rgba(0,0,0,0.6)] focus:before:transition-[box-shadow_0.2s,transform_0.2s] focus:after:absolute focus:!ring-offset-transparent focus:!ring-transparent focus:after:z-[1] focus:after:block focus:after:h-5 focus:after:w-5 focus:after:rounded-full focus:after:content-[''] checked:focus:border-slate-500 checked:focus:bg-slate-500 checked:focus:before:ml-[1.0625rem] checked:focus:before:scale-100 checked:focus:before:shadow-[3px_-1px_0px_13px_#3b71ca] checked:focus:before:transition-[box-shadow_0.2s,transform_0.2s', data: { 'reflex-permanent': '' })
            end +
            tag.div(id: "actions-container-#{step.id}") do
              actions_nested_fields(step)
            end
        end
      end

      def update_step_name
        step_id = element.dataset['step-id'].to_i
        step = @workflow_template.steps.select { |s| s.id == step_id }.first
        step.name = element.value
        cable_ready.remove(
          selector: "[id=from_to_option_#{step.id}]",
          select_all: true
        )
        cable_ready.append(
          selector: '[id=workflow_template_transactions_from]',
          html: tag.option(step.name, value: step.name, id: "from_to_option_#{step.id}"),
          select_all: true
        )
        cable_ready.append(
          selector: '[id=workflow_template_transactions_to]',
          html: tag.option(step.name, value: step.name, id: "from_to_option_#{step.id}"),
          select_all: true
        )
      end

      def label(text)
        tag.label(class: 'block text-sm font-medium text-slate-700') do
          text
        end
      end

      def actions_nested_fields(step)
        step.actions.map do |action|
          action_markdown(action)
        end.join(' ').html_safe
      end

      def add_new_action
        step_id = element.dataset['step-id'].to_i
        @workflow_template.steps.select { |s| s.id == step_id }.first.actions.new(id: uni_random_id)
      end

      def destroy_action
        @step_id = element.dataset['step-id'].to_i
        @action_id = element.dataset['action-id'].to_i
        @step = @workflow_template.steps.select { |s| s.id == @step_id }.first
        @step.actions = @step.actions.reject { |a| a.id == @action_id }
      end

      def action_markdown(action)
        opts_arr = [tag.option('Select Type', value: '', disabled: true, selected: true)]
        Action.action_types.each do |flow_type|
          opts_arr << tag.option(flow_type.first, value: flow_type.first)
        end
        tag.div(class: 'flex flex-col gap-5 mt-5 w-full') do
          tag.div(class: 'flex flex-row justify-between items-center w-full gap-10') do
            tag.div(class: 'flex flex-col w-full') do
              label('Action Type') +
                tag.div(class: 'flex flex-row items-center gap-10 w-full') do
                  tag.select(name: 'workflow_template[steps][][actions][][action_type]', id: :workflow_template_steps_actions_action_type, data: reflex_data_attributes('input->set_action_config').merge({ 'te-select-init': '', 'step-id': action.step.id, 'action-id': action.id, 'reflex-permanent': '' }), class: 'w-full block appearance-none rounded-md border border-slate-300 px-3 py-2 placeholder-slate-400 shadow-sm ') do
                    opts_arr.join(' ').html_safe
                  end +
                    delete_button(data: reflex_data_attributes(:destroy_action).merge({ 'step-id': action.step.id, 'action-id': action.id }))
                end
            end
          end +
            tag.div(class: "#{action.action_type.present? ? 'show' : 'hidden'} rounded border border-slate-300 p-3") do
              if action.action_type.present?
                tag.p(class: 'text-md text-slate-500') { 'Action Config' } +
                  action.action_schema['properties'].map do |key, _value|
                    tag.div(class: 'flex flex-col gap-5 w-full') do
                      tag.div(class: 'flex flex-col') do
                        label(key.humanize) +
                          tag.input(name: "workflow_template[steps][][actions][][params][#{key}]", type: :text, id: "workflow_template_step_#{action.step.id}_actions_#{action.id}_params_#{key}", class: 'w-full block appearance-none rounded-md border border-slate-300 px-3 py-2 placeholder-slate-400 shadow-sm focus:border-slate-500 focus:outline-none focus:ring-slate-500 sm:text-sm disabled:border-slate-200 disabled:bg-slate-50 disabled:text-slate-500', data: { 'reflex-permanent': '' })
                      end
                    end
                  end.join(' ').html_safe
              end
            end
        end
      end

      def create_workflow_template
        @workflow_template.attributes(workflow_template_params)
        @workflow_template.save!
      end

      def submit
        flow_params = workflow_template_params.to_h.except('steps', 'transactions')
        steps = workflow_template_params[:steps].map(&:to_h)
        transactions = workflow_template_params[:transactions]&.map(&:to_h)
        template = WorkflowTemplate.create!(flow_params)
        steps.each do |step_params|
          actions = step_params.delete('actions')
          template.steps.create!(step_params).tap do |step|
            step.actions.create!(actions)
          end
        end
        transactions.each do |transaction_params|
          template.steps.find_by(name: transaction_params['from']).add_child(template.steps.find_by(name: transaction_params['to']))
        end
        cable_ready.redirect_to(url: '/workflows')
      rescue StandardError => e
        prevent_refresh!
        html = tag.div(class: 'bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative text-red') do
          tag.strong(class: 'font-bold') { 'Error' } + tag.span(class: 'block sm:inline') { e.message }
        end
        error_selector = '[id=error-container]'
        cable_ready.append(selector: error_selector, html:)
      end

      def transactions_input_fields(disable_delete: false)
        uni_id = uni_random_id
        tag.div(class: 'flex flex-col min-w-1/2', id: "transaction_#{uni_id}") do
          tag.div(class: 'flex flex-row justify-between items-center w-full gap-10') do
            tag.p(class: 'text-md text-slate-500') { 'Transaction' } +
              delete_button(data: reflex_data_attributes(:destroy_transaction).merge('transaction-id': uni_id), disabled: disable_delete)
          end +
            tag.div(class: 'flex flex-col min-w-1/2') do
              tag.div do
                label('From') +
                  tag.select(name: 'workflow_template[transactions][][from]', id: :workflow_template_transactions_from, data: { 'reflex-permanent': '' }, class: 'w-full block appearance-none rounded-md border border-slate-300 px-3 py-2 placeholder-slate-400 shadow-sm focus:border-slate-500 focus:outline-none focus:ring-slate-500 sm:text-sm') do
                    tag.option('from', value: '', disabled: true, selected: true) +
                      @workflow_template.steps.map do |step|
                        step.name ? tag.option(step.name, value: step.name) : ''
                      end.join(' ').html_safe
                  end
              end +
                tag.div do
                  label('To') +
                    tag.select(name: 'workflow_template[transactions][][to]', id: :workflow_template_transactions_to, class: 'w-full block appearance-none rounded-md border border-slate-300 px-3 py-2 placeholder-slate-400 shadow-sm focus:border-slate-500 focus:outline-none focus:ring-slate-500 sm:text-sm') do
                      tag.option('to', value: '', disabled: true, selected: true) +
                        @workflow_template.steps.map do |step|
                          step.name ? tag.option(step.name, value: step.name) : ''
                        end.join(' ').html_safe
                    end
                end
            end
        end
      end

      def transaction_selector
        "[id='transaction_#{element.dataset['transaction-id']}']"
      end

      def set_action_config
        @workflow_template.steps.select { |s| s.id == element.dataset['step-id'].to_i }.first.actions.select { |a| a.id == element.dataset['action-id'].to_i }.first.action_type = element.value
      end

      def available_liquid_drops
        flow_type = element.value
        @workflow_template.flow_type = flow_type
        @available_drops = @workflow_template.available_drops
      end

      def config_selector
        "[data-id='#{element.dataset['step-id']}_#{element.dataset['action-id']}_action_config']"
      end

      def workflow_template_params
        params.require(:workflow_template).permit(:name, :client_id, :team_id, :flow_type, :client_id, steps: [:name, :auto_run, { actions: [:name, :action_type, { params: {} }] }], transactions: %i[from to])
      end

      def step_forms_container_selector
        "[id='flow-steps-form-container']"
      end

      def actions_continer_selector
        "[id='actions-container-#{element.dataset['step-id']}']"
      end

      def transactions_container_selector
        '[id="transactions-container"]'
      end
    end
  end
end

# rubocop:enable Lint/ImplicitStringConcatenation
