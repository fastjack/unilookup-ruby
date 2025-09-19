require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "Run the CLI executable"
task :run, [:args] do |t, args|
  exec "ruby bin/unilookup #{args[:args]}"
end