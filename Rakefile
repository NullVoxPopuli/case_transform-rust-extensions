# frozen_string_literal: true
require 'bundler/gem_tasks'
require 'rake/clean'
require 'rake/testtask'
require 'bundler/setup'
require 'thermite/tasks'
require 'rubocop'
require 'rubocop/rake_task'

Thermite::Tasks.new(cargo_project_path: 'ext/case_transform')

# desc 'Run Rust & Ruby testsuites'
# task test: ['thermite:build', 'thermite:test'] do
#   # …
# end

RuboCop::RakeTask.new(:rubocop) do |t|
  t.options = ['--display-cop-names']
end

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

task default: ['thermite:build', :test, :rubocop]

desc 'CI test task'
task ci: [:default]
