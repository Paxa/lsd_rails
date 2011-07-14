require 'rails/generators'

module LSD
  class Source < Rails::Generators::Base
    source_root Pathname.new(__FILE__).dirname + '../templates'
    
    def self.init_source_folder
      new.source_directory_files
    end
    
    def source_directory_files
      app_source_folder = 'public/javascripts/Source'
      @app_name = LSD.detect_project_name
      
      empty_directory(app_source_folder)
      
      inside(app_source_folder) do
        root_template 'Application.js'
        root_template 'Widget.js'
        root_template 'package.yml'
        root_template 'app_name.js', @app_name + '.js'
      end
    end
    
    def root_template(source, desrination = nil)
      template(self.class.source_root + source, desrination || source)
    end
  end
end