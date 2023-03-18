# rubocop:disable GitlabSecurity/SystemCommandInjection
# frozen_string_literal: true

namespace :clean do
  desc 'deleting components'
  task components: :environment do
    raise 'This is a development task only' unless Rails.env.development?

    Rails.application.eager_load!
    components = ApplicationComponent.descendants.map(&:name)
    p "======= Found #{components.count} components ======="

    components.each do |component|
      next if component.include?('Ui::')
      next if component == 'View::Workflows::FactoryComponent'

      p "======= deleting #{component} ======="
      system("bundle exec rails d component #{component}")
    end
  end
end

# rubocop:enable GitlabSecurity/SystemCommandInjection
