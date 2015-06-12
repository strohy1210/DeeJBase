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

      // var alt_image= $(this).attr('alt');
      // $(this).attr('src', alt_image);
      first = false;
    });
  }
  var first = true;
  if (first) {
    $(".profile-image img").error(function(){

      // var alt_image= $(this).attr('alt');
      // $(this).attr('src', alt_image);
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
    if ($('#comment_body').val().length > 39 && $('#date').val() != "mm-dd-yyyy" ) {
      $('.submit-comment').removeClass('disabled');
      $('.submit-comment').val("Submit");
    } 
    if ($('#comment_body').val().length <= 39 || $('#date').val() === "mm-dd-yyyy") {
      $('.submit-comment').addClass('disabled');
      if ($('#comment_body').val().length <= 39) {
        $('.submit-comment').val("Type a few more lines to submit");
      }
      else {
        $('.submit-comment').val("Choose date to submit");
      }
    }
  })

  $('#date').click(function() {
    if ($('#comment_body').val().length > 39) {
      $('.submit-comment').removeClass('disabled');
        $('.submit-comment').val("Submit");
      }
    })


  $('.other-ratings').hide();
  $('.less-ratings a').hide();
  $('.more-ratings').click(function(e){
     e.preventDefault();
    $('.other-ratings').toggle();
    $(this).find('a').toggle();
    $('.less-ratings a').toggle();
  });

  $('.less-ratings').click(function(e){
     e.preventDefault();
    $('.other-ratings').toggle();
    $(this).find('a').toggle();
    $('.more-ratings a').toggle();
  })

  $('.fix-comment').hide();
//most use the 'on thing' sot he correct div shows and hides
  $(".fix-comment-link").click(function(e){
    e.preventDefault();
    $('.fix-comment').toggle();
    $(this).find('a').toggle();
  })

  $(".cancel-fix-comment").click(function(e){
     e.preventDefault();
     $('.fix-comment').toggle();
   })



  // $('meta')[6] gets meta description

  // $('.datepicker').click(function(){
  //   $('td').click(function(){
  //     if ($('#comment_body').val().length > 39 && $('#date').val() != "mm-dd-yyyy" ) {
  //       $('.submit-comment').removeClass('disabled');
  //       $('.submit-comment').val("Submit");
  //     }

  //   })
  // })
  // $('.datepicker').on('click','#date',function() {
  //   if ($('#comment_body').val().length > 39 && $('#date').val() != "mm-dd-yyyy" ) {
  //     $('.submit-comment').removeClass('disabled');
  //     $('.submit-comment').val("Submit");
  //   } 
  //   if ($('#comment_body').val().length <= 39 || $('#date').val() === "mm-dd-yyyy") {
  //     $('.submit-comment').addClass('disabled');
  //     $('.submit-comment').val("Choose date and/or type a few more lines to submit");
  //   }
  // })
    // $('.submit-comment').click(function(){
    //   var date = $('.datepicker').attr(value);
    //   $('.datepicker').attr('type', 'date');
    // })

});

$(window).scroll(
    {
        previousTop: 0
    }, 
    function () {
    var currentTop = $(window).scrollTop();
    if (currentTop < this.previousTop) {
        $(".sidebar em").text("Up"); /* optional for demo */
        $(".navbar").show();
    } else {
        $(".sidebar em").text("Down");
        $(".navbar").hide();
    }
    this.previousTop = currentTop;
});