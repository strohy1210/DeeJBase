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
    
  var input = $('#comment_body').val();
  $('.user-rate').on('keyup keypress keydown click input','#comment_body',function() {
    if ($('#comment_body').val().length > 39) {
      $('.submit-comment').removeClass('disabled');
    } 
    if ($('#comment_body').val().length <= 39) {
      $('.submit-comment').addClass('disabled');
    }
  })


    // $('.submit-comment').click(function(){
    //   var date = $('.datepicker').attr(value);
    //   $('.datepicker').attr('type', 'date');
    // })

});