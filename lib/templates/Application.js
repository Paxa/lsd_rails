/*
---
 
script: Application.js
 
description: Main script of application
 
license: Public domain (http://unlicense.org).

authors: Pavel Evstigneev

requires:
  - <%= @app_name %>
  - <%= @app_name %>.Widget
  
  - Widgets/LSD.Widget.Form
  - Widgets/LSD.Widget.Label
  - Widgets/LSD.Widget.Select
  - LSD/LSD.Mixin.Request
  - LSD/LSD.Mixin.Target
  - LSD/LSD.Action.*
  - LSD/LSD.Document
  

provides:
  - <%= @app_name %>.Application
 
...
*/

LSD.Element.pool.push(LSD.Widget);

<%= @app_name %>.Application = new LSD.Document({
  mutations: {
    //'div#fb-root': 'javascript',
  }
});