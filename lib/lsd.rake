namespace :lsd do

  desc "re-create symlinks of packages from gem folder to public/javascripts/Packages"
  task :relink_packages => :environment do
    require 'lsd/packages'
    LSD::Packages.link_to_public(:recreate => true)
  end

  desc "Setups generals paths, links and empty files"
  task :setup => :environment do
    require 'lsd/source'
    require 'lsd/packages'

    LSD::Packages.link_to_public
    LSD::Source.init_source_folder
    
    puts
    puts "Include js in you views"
    puts %{<%= jsus_include "#{LSD.detect_project_name}:*", :development => 'include', :production => 'compressed' %>}
  end
  
  desc "Tests all files on compressor exceptions COMPRESSOR= yui | uglifier"
  task :test_compression => :environment do
    compressor = (ENV['COMPRESSOR'] || Jsus::Middleware.settings[:compression]).to_sym
    script = (ENV['SCRIPT'] || "#{LSD.detect_project_name}:*") + '.js'
    
    puts
    puts "Testing compression for #{script} with #{compressor}"
    puts
    
    m = Jsus::Middleware.new(nil)
    files = m.send(:path_string_to_files, script)
    paths = Jsus::Container.new(*files).required_files(Jsus::Middleware.settings[:includes_root])
    
    paths = paths.last(1) if !!ENV['SINGLE_FILE']
    
    paths.each do |file|
      print file
      source = File.open(File.join(Jsus::Middleware.settings[:includes_root], file), 'r:utf-8', &:read)
      begin
        Jsus::Util::Compressor.new(source, :method => compressor).result
      rescue => e
        puts "  FALED"
        raise e
      end
      puts "  OK"
    end
  end
end