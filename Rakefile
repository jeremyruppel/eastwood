#!/usr/bin/env rake

require 'bundler/gem_tasks'
require 'appraisal'
require 'rspec/core/rake_task'

namespace :eastwood do

  desc "Set up current environment variables"
  task :env do
    require 'rails/version'
    ENV[ 'EASTWOOD_RAILS_NAME' ] = "rails-#{Rails::VERSION::STRING}"
    ENV[ 'EASTWOOD_RAILS_PATH' ] = "spec/rails/#{ENV[ 'EASTWOOD_RAILS_NAME' ]}"
  end

  desc "Remove all test rails apps"
  task :clean => [ :env ] do
    Dir[ 'spec/rails/rails-*' ].each do |app|
      FileUtils.rm_rf app
    end
  end

  desc "Create a test rails app if necessary"
  task :rails do
    if File.exist? ENV[ 'EASTWOOD_RAILS_PATH' ]
      puts "Using existing #{ENV[ 'EASTWOOD_RAILS_NAME' ]} app"
    else
      sh "bundle exec rails new #{ENV[ 'EASTWOOD_RAILS_PATH' ]} -m spec/support/rails_template.rb"
    end
  end

end

RSpec::Core::RakeTask.new :spec => [ :'eastwood:env', :'eastwood:rails' ]
