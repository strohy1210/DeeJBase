$(function(){

$(".update-form").hide();


$('.edit-dj').click(function(){
  $(".update-form").toggle();
  $("#dj-profile").toggle();
  $(this).toggle();
  $('.tracks').hide();
})

$('.cancel-edit').click(function(){
  $(".update-form").toggle();
  $("#dj-profile").toggle();
  $('.edit-dj').toggle();
  $('.tracks').show();
})

$(".other-tracks").hide();
$('.more-tracks').click(function(){
  $(".other-tracks").toggle();
  $(this).toggle();
})

$('.hide-tracks').click(function(){
  $(".other-tracks").toggle();
  $('.more-tracks').toggle();
})
// $('.cancel-message').hide();
// $('.cancel-message').click(function(){
//   $(".message-form").toggle();
//     $(this).toggle();
//     $('.hire-dj').toggle();
// })

$('.contact-form').hide();
$('.send-contact').click(function(){
  $('.contact-form').toggle();
})
$(".rate-dj").hide();
$('.rate-button').click(function(){
  $(".rate-dj").toggle();
  $('.other-info').toggle();
  $(this).toggle();
})

$('.done-rating').click(function(){
  $(".other-info").toggle();
  $('.rate-dj').toggle();
  $('.rate-button').toggle();
})



})
