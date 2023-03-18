# frozen_string_literal: true

class ApplicationReflex < StimulusReflex::Reflex
  include ApplicationHelper
  delegate :current_user, to: :connection
end
