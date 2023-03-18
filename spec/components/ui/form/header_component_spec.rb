# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ui::Form::HeaderComponent, type: :component do
  let(:title) { 'username' }
  let(:description) { 'username' }
  let(:content) { 'Test Content' }
  let(:component) { render_inline(described_class.new(title:, description:)) }

  it 'renders the main class' do
    expect(component).to have_css("[class='mb-4 text-center']")
  end

  it 'renders the title' do
    expect(component).to have_css('h2', text: 'username')
  end

  it 'renders the description' do
    expect(component).to have_css('p', text: 'username')
  end
end
