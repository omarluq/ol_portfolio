# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ui::Form::Field::ParagraphComponent, type: :component do
  let(:form) { ActionView::Helpers::FormBuilder.new(:user, User.new, {}, {}) }
  let(:component) { described_class.new(form:, field: :description, label: 'description', type: :text_area, autofocus: true, autocomplete: true, placeholder: 'Type here', caption: 'Enter a brief description', disabled: false, value: nil, classes: 'form-control', data: {}) }

  describe '#initialize' do
    it 'assigns form' do
      expect(component.instance_variable_get(:@form)).to eq form
    end

    it 'assigns field' do
      expect(component.instance_variable_get(:@field)).to eq :description
    end

    it 'assigns label' do
      expect(component.instance_variable_get(:@label)).to eq 'description'
    end

    it 'assigns type' do
      expect(component.instance_variable_get(:@field_type)).to eq :text_area
    end

    it 'assigns autofocus' do
      expect(component.instance_variable_get(:@autofocus)).to eq true
    end

    it 'assigns autocomplete' do
      expect(component.instance_variable_get(:@autocomplete)).to eq true
    end

    it 'assigns placeholder' do
      expect(component.instance_variable_get(:@placeholder)).to eq 'Type here'
    end

    it 'assigns caption' do
      expect(component.instance_variable_get(:@caption)).to eq 'Enter a brief description'
    end

    it 'assigns disabled' do
      expect(component.instance_variable_get(:@disabled)).to eq false
    end

    it 'assigns value' do
      expect(component.instance_variable_get(:@value)).to be_nil
    end

    it 'assigns classes' do
      expect(component.instance_variable_get(:@classes)).to eq 'form-control'
    end

    it 'assigns data' do
      expect(component.instance_variable_get(:@data)).to eq({})
    end
  end
end
