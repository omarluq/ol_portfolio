# frozen_string_literal: true

module Ui
  class IconComponent < ApplicationComponent
    include HeroiconHelper
    SIZES = { xxxsm: 'h-3 w-3', xxsm: 'h-4 w-4', xsm: 'h-5 w-5', sm: 'h-6 w-6', md: 'h-8 w-8', lg: 'h-10 w-10', xlg: 'h-12 w-12', xxlg: 'h-14 w-14', xxxlg: 'h-16 w-16' }.freeze

    def initialize(name:, variant: :outline, size: :sm, use_assets_icons: false, classes: '', disable_default_class: true, data: {})
      @name = name.to_s
      @variant = variant
      @title = @name.underscore.humanize
      @role = 'img'
      @aria = true
      @size = SIZES[size]
      @use_assets_icons = use_assets_icons
      @classes = classes
      @disable_default_class = disable_default_class
      @data = data
    end

    def call
      file = "app/assets/images/icons/#{@name}.svg"
      if @use_assets_icons && File.exist?(file)
        inline_svg_tag("icons/#{@name}.svg", { title: @title, aria: @aria, 'aria-hidden': !@aria, 'aria-label': @title, role: @role, class: "#{@size} #{@classes}" }.merge(@data.empty? ? {} : { data: @data }))
      else
        heroicon @name, variant: @variant, options: { title: @title, aria: @aria, 'aria-hidden': !@aria, 'aria-label': @title, role: @role, class: "#{@size} #{@classes}", disable_default_class: @disable_default_class }.merge(@data.empty? ? {} : { data: @data })
      end
    end
  end
end
