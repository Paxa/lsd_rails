/*
---
description: The file the requires dependencies. To be required, of course.

license: MIT-style

authors: 

requires:
  - LSD/LSD.Widget
  - LSD/LSD.Document
  - Native/LSD.Native.*
  - Widgets/LSD.Widget.Body
  - Widgets/LSD.Widget.Anchor
  - Widgets/LSD.Widget.Form
  - Widgets/LSD.Widget.Label
  - LSD/LSD.Action.Append
  - LSD/LSD.Action.Update
  - LSD/LSD.Action.Check
  - LSD/LSD.Action.Clone
  - LSD/LSD.Action.Delete
  - LSD/LSD.Action.Display
  - LSD/LSD.Action.Focus
  - LSD/LSD.Action.Replace
  - LSD/LSD.Action.Set
  - LSD/LSD.Action.State
  - LSD/LSD.Action.Submit

provides: [Application]

What is that above?
  It's a list of Application dependencies. It loads:
  * LSD.Widget - The smallest entity of a framework, DOM Element's
                 younger (and prettier) brother. A boy that will do 
                 things for you.
                 
  * LSD.Document - A thing that wraps the whole document, makes
                 <body> a widget and traverses layout to convert 
                 elements into widgets. 
                 
  * LSD.Native.* - Includes a HTML4 set of widgets that handle form
                 fields. It's a wise thing to be closer to DOM and use
                 plain input elements.
                 
  * LSD.Widget...- A basic set of essensial widgets, that augment their
                 elements to do something functional and beautiful.
                 
  * LSD.Action...- A set of actions that widget can execute on self, 
                 other widgets, or plain DOM elements. There're a little
                 more of them (e.g. Edit), but you may not need them now.
                 
  A prefix before slash in expression means (like Native in Native/LSD.Widget.Input)
  is a package name (set in package.yml as "name"). So to require a file
  from a specific package, you have to specify package name as well.

Some useful things to require:

  Mobile/*
    Includes all mobile widgets and mobile adjustements if a browser
    is detected as mobile. 

  LSD/LSD.Mixin.Validity
    Enable HTML5 form validation on all fields.
    
  LSD/LSD.Action.Edit
    Adds edit action that turns a microdata-formatted element into an
    edit in-place form with submit and cancel buttons.
...
*/

LSD.Element.pool.push(LSD.Widget);

<%= @app_name %>.Application = new LSD.Document({
  mutations: {
    //'div#fb-root': 'javascript',
  }
});