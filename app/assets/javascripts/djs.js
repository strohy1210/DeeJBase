$(function(){

$(".update-form").hide();

$('.edit-dj').click(function(){
  $(".update-form").toggle();
  $("#dj-profile").toggle();
})

$('.cancel-edit').click(function(){
  $(".update-form").toggle();
  $("#dj-profile").toggle();
})

$(".message-form").hide();
$('.hire-dj').click(function(){
  $(".message-form").toggle();
  // $(".profile-pic").toggle();
  $(this).toggle();
})

})
