# frozen_string_literal: true

namespace :rspec_template_generator do
  # desc "Copy all the templates from rspec to the application directory for customization. Already existing local copies will be overwritten"
  task copy: :environment do
    generators_lib = File.join(Gem.loaded_specs['rspec-rails'].full_gem_path, 'lib/generators')
    project_templates = Rails.root.join('lib', 'templates').to_s

    default_templates = { 'rspec' => %w[controller helper mailer model scaffold view request system] }

    default_templates.each do |type, names|
      local_template_type_dir = File.join(project_templates, type)
      FileUtils.mkdir_p local_template_type_dir

      names.each do |name|
        dst_name = File.join(local_template_type_dir, name)
        src_name = File.join(generators_lib, type, name, 'templates')
        FileUtils.cp_r src_name, dst_name
      end
    end
  end
end
