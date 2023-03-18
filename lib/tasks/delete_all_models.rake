# rubocop:disable GitlabSecurity/SystemCommandInjection
# frozen_string_literal: true

namespace :delete do
  namespace :all do
    desc 'deleting all models'
    task models: :environment do
      raise 'This is a development task only' unless Rails.env.development?

      Rails.application.eager_load!
      policies = ApplicationPolicy.descendants.map(&:name)
      p "======= Found #{policies.count} policies ======="
      models = ApplicationRecord.descendants.map(&:name)
      p "======= Found #{models.count} models ======="
      models.each do |model|
        next if %w[ApplicationRecored User].include?(model)

        p "======= deleting #{model} ======="
        system("bundle exec rails d model #{model.underscore}")
      end
    end
  end
end

# rubocop:enable GitlabSecurity/SystemCommandInjection
