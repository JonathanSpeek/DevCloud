// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require materialize-sprockets
//= require markdown-toolbar
//= require highcharts
//= require chartkick
//= require_tree .

MarkdownToolbar.buttons = [
    {title: 'Bold',          type: 'wrapper',  left: '**', right: '**', id: 'bold'},
    {title: 'Italic',        type: 'wrapper',  left: '*',  right: '*',  id: 'italic'},
    {id: 'delimiter'},
    {title: 'H1',            type: 'wrapper',  left: '# ', right: ' #', id: 'heading_1'},
    {title: 'H2',            type: 'wrapper',  left: '## ', right: ' ##', id: 'heading_2'},
    {title: 'H3',            type: 'wrapper',  left: '### ', right: ' ###', id: 'heading_3'},
    {id: 'delimiter'},
    {title: 'Bulleted list', type: 'prefixer', left: '* ', id: 'list_bullets'},
    {title: 'Numbered list', type: 'list_numbers', id: 'list_numbers'},
    {title: 'Blockquote',    type: 'prefixer', left: '> ',              id: 'blockquote'},
    // Code:
    {title: 'Source Code',   type: 'block_wrapper',   left: "```\n", right: "\n```", id: 'code'},
    {id: 'delimiter'},
    {title: 'Image',         type: 'image',        id: 'image'},
    {title: 'Link',          type: 'link',         id: 'link'},
];