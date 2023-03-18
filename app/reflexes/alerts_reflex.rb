# frozen_string_literal: true

class AlertsReflex < ApplicationReflex
  def dismiss
    morph :nothing
    cable_ready.remove(selector: "[id='#{element.dataset['alert-id']}']").broadcast
  end
end
