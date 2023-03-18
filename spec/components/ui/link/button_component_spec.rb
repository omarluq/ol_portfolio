# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ui::Link::ButtonComponent, type: :component do
  subject(:component) { described_class.new(label:, size:, path:, method:, classes:) }

  let(:label) { 'Button Label' }
  let(:size) { :sm }
  let(:path) { '/some-path' }
  let(:method) { :get }
  let(:classes) { 'randomclass' }

  it 'renders the correct label' do
    expect(component.instance_variable_get(:@label)).to eq(label)
  end

  it 'renders the correct size' do
    expect(component.instance_variable_get(:@size)).to eq('')
  end

  it 'renders the correct path' do
    expect(component.instance_variable_get(:@path)).to eq(path)
  end

  it 'renders the correct method' do
    expect(component.instance_variable_get(:@method)).to eq('get')
  end

  it 'renders the correct class' do
    expect(component.instance_variable_get(:@classes)).to eq(classes)
  end

  it 'render the correct link label' do
    expect(component.call).to include(label)
  end

  it 'render the correct link path' do
    expect(component.call).to include(path)
  end

  it 'render the correct link method' do
    expect(component.call).to include('method="get"')
  end
end
