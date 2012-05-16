require "rspec/core/rake_task"

task :default => :spec

desc "Run examples"
RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = "--color --format d"
  t.verbose = true
end