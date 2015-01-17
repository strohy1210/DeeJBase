window.App = App = Ember.Application.create({
  rootElement: '#ember-container'
  // LOG_TRANSITIONS: true
});

// if ($('#ember-container').length==0) { 
//   App.deferReadiness();
// }


App.ApplicationAdapter=DS.ActiveModelAdapter.extend()

App.Router.map(function(){
  this.resource('venues', {path: '/list'}, function(){
    this.resource('venue', {path: '/:venue_id'})
  })
});