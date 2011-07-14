require 'rails/generators'

class WidgetGenerator < Rails::Generators::Base
  
  argument :widget_name, :type => :string
  
  source_root Pathname.new(__FILE__).dirname + '../templates'
  
  def create_widget_file
    widgets_path = "public/javascripts/Source/Widget"
    @widget_name = @widget_name.capitalize
    @app_name = LSD.detect_project_name
    
    empty_directory(widgets_path)
    
    inside(widgets_path) do
      template(self.class.source_root + "new_widget.js", @widget_name + '.js')
    end
    
    append_to_file(widgets_path + '/../package.yml') do
      %{  - "Widget/#{@widget_name}.js"}
    end
  end
end