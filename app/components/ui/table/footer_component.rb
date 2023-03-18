# frozen_string_literal: true

module Ui
  module Table
    class FooterComponent < ApplicationComponent
      renders_one :pagination_bar, ->(**system_args) { component('ui/table/pagination_bar', locals: { **system_args }) }
    end
  end
end
