require 'rake/gempackagetask'
require 'rake/testtask'
require 'yard'

spec = eval(File.open("bean.gemspec").read)
Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_tar = true
end

Rake::TestTask.new do |t|
  t.pattern = "test/test_*.rb"
  t.libs << ['test', 'lib']
end

desc 'Generate documentation'
YARD::Rake::YardocTask.new do |t|
  t.files   = ['lib/**/*.rb', '-', 'LICENSE']
  t.options = ['--main', 'README.md', '--no-private']
end

task :tag do
  sh "git tag -m 'Tagging release: #{Bean::VERSION}' -a v#{Bean::VERSION}"
end

namespace :gem do
  desc 'Upload gem to rubygems.org'
  task :push => [:package, :tag] do
    sh "gem push pkg/bean-#{Bean::VERSION}.gem"
  end
end
