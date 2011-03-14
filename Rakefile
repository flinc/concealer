require 'bundler'
require 'bundler/setup'

require 'rspec/core/rake_task'
require 'rdoc/task'

Bundler::GemHelper.install_tasks

spec = Gem::Specification.load("concealer.gemspec")

RSpec::Core::RakeTask.new(:spec)

RDoc::Task.new do |rdoc|
  rdoc.generator = 'hanna'
  rdoc.rdoc_dir = 'doc'
  rdoc.main = "README.rdoc"
  rdoc.options += spec.rdoc_options
  rdoc.rdoc_files.include(spec.extra_rdoc_files)
  rdoc.rdoc_files.include('lib/**/*.rb')
  rdoc.title = "#{spec.name} #{spec.version}"
end

task :default => :spec