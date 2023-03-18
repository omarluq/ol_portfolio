# frozen_string_literal: true

module Ui
  module Form
    module Container
      class CardComponent < ApplicationComponent
        def call
          tag.div(class: 'mt-8 sm:mx-auto lg:w-1/2 sm:w-full') do
            tag.div(class: 'bg-black py-10 px-6 shadow sm:rounded-lg sm:px-10 w-full') do
              content
            end
          end
        end
      end
    end
  end
end
