// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require handlebars
//= require ember
//= require ember-data
//= require cocoon
//= require_tree .


$(function(){
  // $('.venue .address').hide();
  // $('ul').on('mouseover', 'li', function(){
  //   $(this).find('.address').show()
  // })
  //   $('ul').on('mouseout', 'li', function(){
  //   $(this).find('.address').hide()
  // })
  var first = true;
  if (first) {
    $("img").error(function(){

      var alt_image= $(this).attr('alt');
      $(this).attr('src', alt_image);
      first = false;
    });
  }


  // var images = $('.index-image a img');

  // for (var i=0; i < images.length; i++){
  //   debugger;
  //   images[i].error(function(){
  //     var backup= $(this).attr('alt');
  //     $(this).attr('src', backup);
  //   })
  // }

})