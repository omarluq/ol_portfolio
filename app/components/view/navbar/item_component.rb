# frozen_string_literal: true

module View
  module Navbar
    class ItemComponent < ApplicationComponent
      def initialize(title:, icon: nil, **opts)
        @title = title
        @icon = icon
        @url = "/#{title.downcase}"
        @visbility = opts[:class] || ''
      end

      def before_render
        @class = request.path.gsub('/', '') == @title.downcase ? 'bg-slate-400 rounded-md !text-black scale-110' : ''
      end

      def collection_key
        @index
      end

      def trigger_activate
        prevent_refresh!
        stimulate(@reflex, { key: @data_key })
      end
    end
  end
end
