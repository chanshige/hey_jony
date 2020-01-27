# frozen_string_literal: true

require 'rake/testtask'
require_relative 'bootstrap'

namespace :db do
  migration_context = ActiveRecord::MigrationContext.new(
      File.expand_path('./db/migration', BASE_DIR),
      ActiveRecord::SchemaMigration
  )

  desc "Migrate the database (option: VERSION=x)"
  task :migrate do
    migration_context.migrate ENV['VERSION'] ? ENV['VERSION'] : nil
  end

  desc "Rolls the schema back to the previous version (specify steps w/ STEP=n)"
  task :rollback do
    migration_context.rollback ENV['STEPS'] ? ENV['STEPS'] : 1
  end

  desc "Retrieves the current schema version number"
  task :version do
    p ActiveRecord::Migration.current_version
  end
end

Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/*_test.rb']
end

task default: :test
