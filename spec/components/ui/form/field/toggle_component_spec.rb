# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ui::Form::Field::ToggleComponent, type: :component do
  let(:label) { 'username' }
  let(:description) { 'username' }
  let(:type) { :inline }
  let(:component) { render_inline(described_class.new(field: false, label:, description:, type:, disabled: false, value: false, classes: 'block text-sm font-medium text-slate-700')) }

  it 'renders the icon component' do
    expect(component).to have_css("[title='X mark']")
  end

  context 'when status of toggle is off' do
    let(:toggle_off) { render_inline(described_class.new(field: false, label:, description:, type:, disabled: false, value: false, classes: 'block text-sm font-medium text-slate-700')) }

    it 'renders the background' do
      # p toggle_off
      expect(toggle_off).to have_css("[class='bg-slate-200 relative inline-flex h-6 w-11 flex-shrink-0 cursor-pointer rounded-full border-2 border-transparent transition-colors duration-200 ease-in-out focus:outline-none focus:ring-2 focus:ring-slate-500 focus:ring-offset-2']")
    end

    it 'renders the effect' do
      expect(toggle_off).to have_css("[class='ease-in duration-200 absolute inset-0 flex h-full w-full items-center justify-center transition-opacity']")
    end

    it 'renders the translate effect' do
      expect(toggle_off).to have_css("[class='translate-x-0 pointer-events-none relative inline-block h-5 w-5 transform rounded-full bg-black shadow ring-0 transition duration-200 ease-in-out']")
    end
  end

  context 'when status of toggle is on' do
    let(:toggle_on) { render_inline(described_class.new(field: false, label:, description:, type:, disabled: false, value: true, classes: 'block text-sm font-medium text-slate-700')) }

    it 'renders the background' do
      expect(toggle_on).to have_css("[class='bg-slate-600 relative inline-flex h-6 w-11 flex-shrink-0 cursor-pointer rounded-full border-2 border-transparent transition-colors duration-200 ease-in-out focus:outline-none focus:ring-2 focus:ring-slate-500 focus:ring-offset-2']")
    end

    it 'renders the effect' do
      expect(toggle_on).to have_css("[class='ease-out duration-100 absolute inset-0 flex h-full w-full items-center justify-center transition-opacity']")
    end

    it 'renders the translate effect' do
      expect(toggle_on).to have_css("[class='translate-x-5 pointer-events-none relative inline-block h-5 w-5 transform rounded-full bg-black shadow ring-0 transition duration-200 ease-in-out']")
    end
  end

  it 'renders the icon class' do
    expect(component).to have_css("[class='sr-only']")
  end

  it 'renders with role of img' do
    expect(component).to have_css('[role=img]')
  end

  it 'renders default area-hidden false' do
    expect(component).to have_css('[aria-hidden=false]')
  end

  it 'renders default aria true' do
    expect(component).to have_css('[aria=true]')
  end
end
