# frozen_string_literal: true

module View
  module Contact
    class BaseComponent < ApplicationComponent
      def submit
        ContactRequest.create!(contact_request_params)
        html = View::Alerts::BaseComponent.new
        refresh_all!
        cable_ready.insert_adjacent_html(
          selector: '[id="alerts_container"]',
          html: ApplicationController.render(html, layout: false)
        )
      rescue StandardError => e
        prevent_refresh!
        html = View::Error::BaseComponent.new(error: e)
        cable_ready.insert_adjacent_html(
          selector: '[id="errors_container"]',
          html: ApplicationController.render(html, layout: false)
        )
      end

      def contact_request_params
        params.require(:contact_request).permit(:name, :email, :phone, :message)
      end
    end
  end
end
