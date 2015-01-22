// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


// $(function(){
//   // $('.venue .address').hide();
//   // $('ul').on('mouseover', 'li', function(){
//   //   $(this).find('.address').show()
//   // })
//   //   $('ul').on('mouseout', 'li', function(){
//   //   $(this).find('.address').hide()
//   // })
//  debugger;
// $("img").error(function(){

//         $(this).hide();
// });

$(function(){

  var first = true;
  if (first) {
    $(".index-image a img").error(function(){

      var alt_image= $(this).attr('alt');
      $(this).attr('src', alt_image);
      first = false;
    });
  }
  var first = true;
  if (first) {
    $(".profile-image img").error(function(){

      var alt_image= $(this).attr('alt');
      $(this).attr('src', alt_image);
      first = false;
    });
  }

    $('.datepicker').datepicker({
        format: 'mm-dd-yyyy',
        endDate: '+0d',
        autoclose: true
    });

    // $('.submit-comment').click(function(){
    //   var date = $('.datepicker').attr(value);
    //   $('.datepicker').attr('type', 'date');
    // })

});