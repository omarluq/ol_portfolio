# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ui::Form::Field::FileUploadComponent, type: :component do
  let(:model) { false }
  let(:label) { '' }
  let(:size) { :sm }
  let(:classes) { '' }
  let(:component) { render_inline(described_class.new(model:, label:, size:, classes:)) }

  it 'renders the icon component' do
    expect(component).to have_css("[title='Document plus']")
  end

  it 'renders with type as button' do
    expect(component).to have_css("[type='button']")
  end

  it 'renders with css' do
    expect(component).to have_css("[class='relative block w-full rounded-lg border-2 border-dashed border-slate-300 p-12 text-center hover:border-slate-400 focus:outline-none focus:ring-2 focus:ring-slate-500 focus:ring-offset-2']")
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

  it 'renders default' do
    expect(component).to have_css("[class='mt-2 block font-medium text-slate-500']")
  end
end
