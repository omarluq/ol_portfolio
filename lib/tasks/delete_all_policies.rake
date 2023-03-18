# rubocop:disable GitlabSecurity/SystemCommandInjection
# frozen_string_literal: true

namespace :delete do
  namespace :all do
    desc 'deleting policies for models'
    task policies: :environment do
      raise 'This is a development task only' unless Rails.env.development?

      Rails.application.eager_load!
      policies = ApplicationPolicy.descendants.map(&:name)
      p "======= Found #{policies.count} policies ======="
      policies.each do |policy|
        p "======= Deleting policy for #{policy} ======="
        system("bundle exec rails d action_policy:policy #{policy.underscore.gsub('_policy', '')}")
      end
    end
  end
end

# rubocop:enable GitlabSecurity/SystemCommandInjection
