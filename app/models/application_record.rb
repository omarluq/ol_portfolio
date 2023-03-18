# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  # allows models to expose attributes to liquid templates by defining a drops method
end
