# frozen_string_literal: true

# optimism gem channel

class OptimismChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'OptimismChannel'
  end
end
