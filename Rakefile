require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'parallel'
require 'json'
require 'yard'

# @browsers = JSON.load(open('browser.json'))
# @parallel_limit = ENV["nodes"] || 1
# @parallel_limit = @parallel_limit.to_i

# task :cucumber do
#   Parallel.map(@browsers, :in_processes => @parallel_limit) do |browser|
#     begin
#       puts "Running with: #{browser.inspect}"
#       ENV['SELENIUM_BROWSER'] = browser['browser']
#       ENV['SELENIUM_VERSION'] = browser['browser_version']
#       ENV['BS_AUTOMATE_OS'] = browser['os']
#       ENV['BS_AUTOMATE_OS_VERSION'] = browser['os_version']
#
#       Rake::Task[:run_features].execute()
#     rescue RuntimeError => e
#       puts "Error while running task"
#     end
#   end
# end

Cucumber::Rake::Task.new(:run_features)
task :default => [:cucumber]

YARD::Rake::YardocTask.new(:yard) do |t|
  t.files = ['features/**/*.feature', 'features/**/*.rb']
#t.options = ['--any', '--extra', '--opts'] # optional
end

# Cucumber::Rake::Task.new(:cucumber) do |t|
#   # t.cucumber_opts = "features --format pretty"
# end

task :parallel_cucumber do
  sh "bundle exec parallel_cucumber features/"
end
