# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ui::Dropdown::SectionComponent, type: :component do
  let(:label) { 'username' }
  let(:description) { 'test username' }
  let(:classes) { '' }
  let(:component) { render_inline(described_class.new(label:, description:, classes:)) }

  it 'renders the section component with class' do
    expect(component).to have_css("[class='border-b border-slate-200 pb-1']")
  end

  it 'renders the section component with label' do
    expect(component).to have_css('p', text: 'username')
  end

  it 'renders the section component with description' do
    expect(component).to have_css('p', text: 'test username')
  end
end
