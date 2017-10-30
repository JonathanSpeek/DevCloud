# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  simplemde = new SimpleMDE(showIcons: ["code", "table", "strikethrough"], hideIcons: ["side-by-side", "fullscreen"],renderingConfig: {codeSyntaxHighlighting: true}, autosave: { enabled: true, uniqueId: "MyUniqueID", delay: 1000 },element: document.getElementById('SimpleMDE-Text-Area'))
