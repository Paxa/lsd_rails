/*
---
description: Basic widget
 
license: Public domain (http://unlicense.org).

authors: 
 
requires:
  - <%= @app_name %>
  - LSD/LSD.Type

provides:
  - <%= @app_name %>.Widget
 
...
*/

new LSD.Type('Widget', '<%= @app_name %>');

// Inject native widgets into default widget pool as a fallback
LSD.Element.pool.unshift(<%= @app_name %>.Widget);