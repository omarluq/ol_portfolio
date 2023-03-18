# rubocop:disable GitlabSecurity/SystemCommandInjection
# frozen_string_literal: true

namespace :generate do
  namespace :models do
    desc 'generating policies for models'
    task policies: :environment do
      raise 'This is a development task only' unless Rails.env.development?

      Rails.application.eager_load!
      policies = ApplicationPolicy.descendants.map(&:name)
      p "======= Found #{policies.count} policies ======="
      models = ApplicationRecord.descendants.map(&:name)
      p "======= Found #{models.count} models ======="
      models.each do |model|
        next if policies.include?("#{model}Policy")

        p "======= Generating policy for #{model} ======="
        system("bundle exec rails g action_policy:policy #{model.underscore}")
      end
    end
  end
end

# rubocop:enable GitlabSecurity/SystemCommandInjection
