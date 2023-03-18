# frozen_string_literal: true

module Ui
  module Table
    class PaginationBarComponent < ApplicationComponent
      include Pagy::Frontend

      def initialize(pagy:)
        @pagy = pagy
      end

      def page_items_count
        @pagy.vars[:items].to_s
      end

      def total_items_count
        "of #{@pagy.vars[:count]} Items"
      end

      def call
        tag.div(class: 'flex flex-row justify-between items-center h-full') do
          tag.div(class: 'mr-3 flex flex-row') do
            tag.p(class: 'text-sm text-slate-200 leading-5 mr-1') { page_items_count } +
              tag.p(class: 'text-sm text-slate-400 leading-5') { total_items_count }
          end +
            tag.div(class: 'h-full') do
              pagy_nav(@pagy).html_safe
            end
        end
      end
    end
  end
end
