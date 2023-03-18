# frozen_string_literal: true

class ErrorsReflex < ApplicationReflex
  def dismiss
    morph :nothing
    cable_ready.remove(selector: "[id='#{element.dataset['error-id']}']").broadcast
  end
end
