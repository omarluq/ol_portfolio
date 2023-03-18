# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ui::IconComponent, type: :component do
  let(:default_eye) { render_inline(described_class.new(name: 'eye')) }

  # ROLE
  it 'renders with role of img' do
    expect(default_eye).to have_css('[role=img]')
  end

  # TITLE
  it 'renders the svg with title ' do
    expect(default_eye).to have_css('[title=Eye]')
  end

  it 'renders default area-hidden false' do
    expect(default_eye).to have_css('[aria-hidden=false]')
  end

  it 'renders default aria-label Eye' do
    expect(default_eye).to have_css('[aria-label=Eye]')
  end

  it 'renders default aria true' do
    expect(default_eye).to have_css('[aria=true]')
  end

  it 'renders default class h-6 w-6' do
    expect(default_eye).to have_css("[class='h-6 w-6 ']")
  end

  # SIZE
  context 'when icon of size xxxsm is rendered' do
    let(:default_eye_size) { render_inline(described_class.new(name: 'eye', size: :xxxsm)) }

    it 'renders the svg of size xxxsm' do
      expect(default_eye_size).to have_css("[class='h-3 w-3 ']")
    end
  end

  context 'when icon of size xxsm is rendered' do
    let(:default_eye_size) { render_inline(described_class.new(name: 'eye', size: :xxsm)) }

    it 'renders the svg of size xxsm' do
      expect(default_eye_size).to have_css("[class='h-4 w-4 ']")
    end
  end

  context 'when icon of size xsm is rendered' do
    let(:default_eye_size) { render_inline(described_class.new(name: 'eye', size: :xsm)) }

    it 'renders the svg of size xsm' do
      expect(default_eye_size).to have_css("[class='h-5 w-5 ']")
    end
  end

  context 'when icon of size sm is rendered' do
    let(:default_eye_size) { render_inline(described_class.new(name: 'eye', size: :sm)) }

    it 'renders the svg of size sm' do
      expect(default_eye_size).to have_css("[class='h-6 w-6 ']")
    end
  end

  context 'when icon of size md is rendered' do
    let(:default_eye_size) { render_inline(described_class.new(name: 'eye', size: :md)) }

    it 'renders the svg of size md' do
      expect(default_eye_size).to have_css("[class='h-8 w-8 ']")
    end
  end

  context 'when icon of size lg is rendered' do
    let(:default_eye_size) { render_inline(described_class.new(name: 'eye', size: :lg)) }

    it 'renders the svg of size lg' do
      expect(default_eye_size).to have_css("[class='h-10 w-10 ']")
    end
  end

  context 'when icon of size xlg is rendered' do
    let(:default_eye_size) { render_inline(described_class.new(name: 'eye', size: :xlg)) }

    it 'renders the svg of size xlg' do
      expect(default_eye_size).to have_css("[class='h-12 w-12 ']")
    end
  end

  context 'when icon of size xxlg is rendered' do
    let(:default_eye_size) { render_inline(described_class.new(name: 'eye', size: :xxlg)) }

    it 'renders the svg of size xxlg' do
      expect(default_eye_size).to have_css("[class='h-14 w-14 ']")
    end
  end

  # VARIANTS
  context 'when icon of variant outline is rendered' do
    let(:default_eye_variant) { render_inline(described_class.new(name: 'eye', size: :md, variant: :outline)) }

    it 'sets the svg fill to none' do
      expect(default_eye_variant).to have_css("[fill='none']")
    end

    it 'sets the stroke width to 1.5' do
      expect(default_eye_variant).to have_css("[stroke-width='1.5']")
    end
  end

  context 'when icon of variant fill is rendered' do
    let(:default_eye_variant) { render_inline(described_class.new(name: 'eye', size: :md, variant: :fill)) }

    it 'renders the svg of variant solid' do
      expect(default_eye_variant).to have_css("[fill='currentColor']")
    end
  end

  # DEFAULT CLASS
  context 'when icon renders with default class' do
    let(:default_eye_class) { render_inline(described_class.new(name: 'eye', size: :md, variant: :outline, disable_default_class: false)) }

    it 'renders the svg with default class' do
      expect(default_eye_class).to have_css("[class='h-6 w-6 h-8 w-8']")
    end
  end

  context 'when icon does not renders with default class' do
    let(:default_eye_class) { render_inline(described_class.new(name: 'eye', size: :md, variant: :outline, disable_default_class: true)) }

    it 'renders the svg without default class' do
      expect(default_eye_class).to have_css("[class='h-8 w-8 ']")
    end
  end
end
