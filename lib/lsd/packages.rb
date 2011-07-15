module LSD
  module Packages
    extend self
    
    def package_list
      Dir.entries(LSD.gem_folder + 'Packages').select do |package|
        package[0, 1] != '.'
      end
    end
    
    def link_to_public(options = {})
      packages_folder = Rails.root + 'public/javascripts/Packages'
      FileUtils.mkdir_p(packages_folder)
      
      package_list.each do |package|
        FileUtils.rm(packages_folder + package) if options[:recreate] && File.symlink?(packages_folder + package)
        if !File.exists?(packages_folder + package)
          FileUtils.ln_s(LSD.gem_folder + 'Packages' + package, packages_folder + package)
        else
          puts "#{packages_folder + package} already exists"
        end
      end
    end
  end
end