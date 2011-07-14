module LSD
  class Railtie < Rails::Railtie
    
    initializer "jsus middleware" do
      if defined?(Jsus)
        Jsus::Middleware.settings = {
          :cache         => true,
          :cache_path    => "#{Rails.root}/public/javascripts/jsus",
          :packages_dir  => ["#{Rails.root}/public/javascripts/Packages", "#{Rails.root}/public/javascripts/Source"],
          :cache_pool    => true,
          :includes_root => "#{Rails.root}/public",
          :log_method    => Rails.env.development? ? :console : false,
          :postproc      => 'moocompat12'
        }
        
        Rails.configuration.middleware.use Jsus::Middleware
        Jsus.look_for_cycles = false
      end
    end
    
    initializer "include helper" do
      ActionView::Base.send :include, LSD::Helper
    end
    
    rake_tasks do
      load "lsd.rake"
    end
    
    generators do
      require 'lsd/widget_generator'
    end
  end
end