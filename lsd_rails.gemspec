Gem::Specification.new do |s|
  s.name              = "lsd_rails"
  s.version           = "0.1"
  s.summary           = "Applyng components for rails"
  s.description       = ""
  s.author            = "Pavel Evstigneev"
  s.email             = "pavel.evst@gmail.com"
  s.homepage          = "http://github.com/Paxa/lsd_rails"
  s.has_rdoc          = false
  s.executables       = []
  s.rubyforge_project = "lsd_rails"
  s.files             = Dir.glob('lib/**/**') + Dir.glob('Packages/**/**')
  
  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.0.0"])
    else
      s.add_dependency(%q<rails>, [">= 3.0.0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.0.0"])
  end
end