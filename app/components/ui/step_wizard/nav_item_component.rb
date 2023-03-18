# frozen_string_literal: true

module Ui
  module StepWizard
    class NavItemComponent < ApplicationComponent
      TEXT_COLOR = { current: 'text-slate-600', upcoming: 'text-slate-500', completed: '' }.freeze
      BG_COLOR = { current: 'border-slate-600 bg-black', upcoming: 'border-slate-300 bg-black group-hover:border-slate-400', completed: 'bg-slate-600 group-hover:bg-slate-800' }.freeze

      def initialize(title:, description:, data:, variant: :current, last_step: false)
        @title = title
        @description = description
        @data = data
        @last_step = last_step
        @variant = variant
        @text_color = TEXT_COLOR[@variant]
        @bg_color = BG_COLOR[@variant]
      end

      def collection_key
        SecureRandom.hex(16)
      end
    end
  end
end
