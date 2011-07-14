module LSD
  module Helper
    
    # = jsus_include "LsdTest:*", :development => 'include', :production => 'compressed'
    # = jsus_include "LsdTest:*", :method => 'require'
    def jsus_include(path, options = {})
      method = options[Rails.env.to_sym] || options[:method] || 'require'
      javascript_include_tag "jsus/#{method}/#{path}"
    end
    
  end
end