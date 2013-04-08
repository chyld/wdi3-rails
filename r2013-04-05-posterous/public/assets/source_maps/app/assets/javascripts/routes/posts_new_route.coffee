App.PostsNewRoute = Ember.Route.extend
  model: ->  App.Post.createRecord()
