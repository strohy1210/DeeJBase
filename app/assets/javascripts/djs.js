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

})
