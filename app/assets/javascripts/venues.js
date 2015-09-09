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

  // var first = true;
  // if (first) {
  //   $(".index-image a img").error(function(){

  //     // var alt_image= $(this).attr('alt');
  //     // $(this).attr('src', alt_image);
  //     first = false;
  //   });
  // }
  // var first = true;
  // if (first) {
  //   $(".profile-image img").error(function(){

  //     // var alt_image= $(this).attr('alt');
  //     // $(this).attr('src', alt_image);
  //     first = false;
  //   });
  // }

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
        $('.submit-comment').val("Type a few more lines!");
      }
      else {
        $('.submit-comment').val("Choose date!");
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
  var columns = $("#links img").length;
  $("#links img").each(function() {
      var src = $(this).attr('src');
      var a = $('<a/>').attr('href', src);
      $(this).wrap(a);
      $(this).addClass("img-thumbnail");
      if (columns === 2){
        $('#links').removeClass("col-md-8");
        $('#links').addClass("col-md-6 col-md-offset-2");
      }
      $(this).parent().addClass("text-right col-md-"+(12/columns).toString());
  });

    //count images and add col-md-12/count
  // $("#select_origin").tooltip();


});

$(window).scroll(
    {
        previousTop: 0
    }, 
    function () {
    var currentTop = $(window).scrollTop();
    if (currentTop <= this.previousTop) {
        $(".navbar").show();
    } else if ($(window).scrollTop() > 30) {
        $(".navbar").hide();
    }
    this.previousTop = currentTop;
});