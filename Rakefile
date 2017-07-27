# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rake/testtask'
require 'helix_runtime/build_task'
require 'rubocop'
require 'rubocop/rake_task'

HelixRuntime::BuildTask.new("case_transform")

RuboCop::RakeTask.new(:rubocop) do |t|
  t.options = ['--display-cop-names']
end

# For Windows
$stdout.sync = true

# HelixRuntime::BuildTask.new("text_transform") do |t|
#   t.build_root = File.expand_path("../..", __dir__)
#   t.helix_lib_dir = File.expand_path("../../ruby/windows_build", __dir__)
#   t.pre_build = HelixRuntime::Tests.pre_build
# end

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

task test: :build
task default: %i[rubocop test]

desc 'CI test task'
task ci: [:default]
