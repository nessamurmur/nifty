require 'bundler/setup'
require 'padrino-core/cli/rake'
require 'rspec/core/rake_task'
require 'generative/rake_task'

task(:default).enhance [:spec, :generative]

RSpec::Core::RakeTask.new
Generative::RakeTask.new

PadrinoTasks.use(:database)
PadrinoTasks.use(:sequel)
PadrinoTasks.init
