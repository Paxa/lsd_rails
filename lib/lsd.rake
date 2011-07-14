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
  end
end