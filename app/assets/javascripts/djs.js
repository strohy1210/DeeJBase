$(function(){

$(".update-form").hide();

$('.edit-dj').click(function(){
  $(".update-form").toggle();
  $("#dj-profile").toggle();
  $(this).toggle();
})

$('.cancel-edit').click(function(){
  $(".update-form").toggle();
  $("#dj-profile").toggle();
  $('.edit-dj').toggle();
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



})
