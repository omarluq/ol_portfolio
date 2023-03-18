# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ui::Modal::PopUpComponent, type: :component do
  let(:modal) { render_inline(described_class.new) }

  it 'renders the modal with class' do
    expect(modal).to have_css("[class='max-w-fit']")
  end

  it 'returns true' do
    pop_up = described_class.new
    expect(pop_up.hidden).to be true
  end

  context 'when the pop up is opened' do
    it 'returns false' do
      pop_up = described_class.new
      pop_up.open
      expect(pop_up.hidden).to be false
    end
  end

  context 'when the pop up is closed' do
    it 'returns true' do
      pop_up = described_class.new
      pop_up.open
      pop_up.close
      expect(pop_up.hidden).to be true
    end
  end
end
