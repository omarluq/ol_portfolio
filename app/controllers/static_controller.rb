# frozen_string_literal: true

class StaticController < ApplicationController
  def root
    component "view#{request.path}/base"
  end
end
