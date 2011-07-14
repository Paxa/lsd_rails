require "pathname"
require "fileutils"

module LSD
  
  require 'lsd/helper'
  require 'lsd/railtie'
  
  def self.gem_folder
    Pathname.new(File.join(File.dirname(__FILE__), '..'))
  end
  
  # module LsdTest
  #   class Application < Rails::Application
  def self.detect_project_name
    application_source = File.open(Rails.root + 'config/application.rb', 'r:utf-8', &:read)
    application_source.match("module\s+([A-Za-z0-9]+)")[1]
  end
  
end