var App = Ember.Application.create({
   LOG_TRANSITIONS: true
});

App.ApplicationAdapter =DS.ActiveModelAdapter.extend()


App.Router.map(function(){
  this.resource('venues', function(){
    this.resource('venue', {path: '/:venue_id'})
  })
});