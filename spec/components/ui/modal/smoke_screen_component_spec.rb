# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ui::Modal::SmokeScreenComponent, type: :component do
  subject(:smoke_screen_component) { described_class.new(data:) }

  let(:data) { { reflex: 'test-smoke-screen-reflex', key: 'test-smoke-screen-key' } }

  describe '#call' do
    it 'renders the smoke screen with correct id' do
      smoke_screen = smoke_screen_component.call
      expect(smoke_screen).to have_css("[id='modal-smoke-screen']")
    end

    it 'renders the smoke screen with correct class' do
      smoke_screen = smoke_screen_component.call
      expect(smoke_screen).to have_css("[class='shadow-xl bg-black-transparent animated fadeIn fixed inset-0 overflow-hidden flex items-center justify-center']")
    end

    it 'renders the smoke screen with correct style' do
      smoke_screen = smoke_screen_component.call
      expect(smoke_screen).to have_css("[style='z-index:9998']")
    end

    it 'renders the smoke screen with correct data-flex' do
      smoke_screen = smoke_screen_component.call
      expect(smoke_screen).to have_css("[data-reflex='test-smoke-screen-reflex']")
    end

    it 'renders the smoke screen with correct data-key' do
      smoke_screen = smoke_screen_component.call
      expect(smoke_screen).to have_css("[data-key='test-smoke-screen-key']")
    end
  end
end
