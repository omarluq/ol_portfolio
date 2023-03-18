# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ui::Dropdown::MenuComponent, type: :component do
  let(:classes) { '' }
  let(:component) { render_inline(described_class.new(classes:)) }

  it 'renders the menu compment with data-controller' do
    expect(component).to have_css("[data-controller='ui--dropdown--menu']")
  end

  it 'renders the menu compment with class' do
    expect(component).to have_css("[class='relative inline-block text-left']")
  end

  it 'renders the menu compment with role' do
    expect(component).to have_css("[role='menu']")
  end

  it 'renders the menu compment with aria-orientation' do
    expect(component).to have_css("[aria-orientation='vertical']")
  end

  it 'renders the menu compment with aria-labelledby' do
    expect(component).to have_css("[aria-labelledby='user-menu-button']")
  end

  it 'renders the menu compment with tabindex' do
    expect(component).to have_css("[tabindex='-1']")
  end

  it 'renders the menu compment with style' do
    expect(component).to have_css("[style='z-index:9997']")
  end
end
