App.PostsNewController = Ember.ObjectController.extend
  save: ->
    @get('store').commit()
    @transitionToRoute('posts.index')
