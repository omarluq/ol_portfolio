# frozen_string_literal: true

class ApplicationComponent < ViewComponentReflex::Component
  include ApplicationHelper
  include Turbo::FramesHelper
  include Pagy::Backend
  include ActionPolicy::Behaviour

  def before_render
    @current_user = Current.user
  end

  def disabled_effect
    @disabled ? 'disabled:!cursor-not-allowed disabled:opacity-50 ' : ''
  end
end
