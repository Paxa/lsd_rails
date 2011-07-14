About
=====

This is set of helpers and generators for LSD

Gem contains dependent libraries, so you don't need to make a lot of submodules. And it make symlinks to javascripts-folder so you can easily look in LSD source. 

Usage
=====

add to Gemfile

    gem 'lsd_rails'
    gem 'jsus'
    
run

    rake lsd:setup

Include sources using jsus helper (replace 'MyProject' as you need)

    <%= jsus_include "MyProject:*", :development => 'include', :production => 'compressed' %>
    
If you run JSUS in production you should recreate symlinks by 

    rake lsd:relink_packages