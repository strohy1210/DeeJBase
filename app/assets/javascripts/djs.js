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

// $(".message-form").hide();
// $('.hire-dj').click(function(){
//   $(".message-form").toggle();
//   $('.cancel-message').toggle()
//   // $(".profile-pic").toggle();
//   $(this).toggle();
// })

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
