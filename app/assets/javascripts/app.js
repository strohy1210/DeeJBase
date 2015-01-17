window.App = App = Ember.Application.create({
  rootElement: '#ember-container'
  // LOG_TRANSITIONS: true

  $(".update-form").hide();

  $(".rate-dj").hide();

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
    $(".other-tracks").slideDown();
    $(this).toggle();
    $('#comments').toggle();
    $('.comments-title').toggle();
    $('.tracks').removeClass('col-md-8');
  })

  $('.hide-tracks').click(function(){
    $(".other-tracks").toggle();
    $('.more-tracks').toggle();
      $('#comments').toggle();
    $('.comments-title').toggle();
     $('.tracks').addClass('col-md-8');
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
    $('.close-contact').toggle();
    $(this).toggle();
  })


  $('.close-contact').hide();
  $('.close-contact').click(function(){
    $('.contact-form').toggle();
    $('.send-contact').toggle();
    $(this).toggle();
  })

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
});



App.ApplicationAdapter=DS.ActiveModelAdapter.extend()

App.Router.map(function(){
  this.resource('venues', {path: '/list'}, function(){
    this.resource('venue', {path: '/:venue_id'})
  })
});

