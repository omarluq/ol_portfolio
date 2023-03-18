# frozen_string_literal: true

module ApplicationHelper
  def component(component_path, collection: nil, locals: {}, &block)
    component_klass = "#{component_path.classify}Component".constantize
    if collection
      render component_klass.with_collection(collection, **locals), &block
    else
      render component_klass.new(**locals), &block
    end
  end

  def viewport_meta_tag(content: 'width=device-width, initial-scale=1',
                        turbo_native: 'maximum-scale=1.0, user-scalable=0')
    full_content = [content, (turbo_native if turbo_native_app?)].compact.join(', ')
    tag.meta name: 'viewport', content: full_content
  end
end
