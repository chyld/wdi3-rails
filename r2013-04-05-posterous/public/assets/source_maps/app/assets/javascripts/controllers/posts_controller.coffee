App.PostsController = Ember.ArrayController.extend
  delete: (post) ->
    @removeObject(post)
    post.deleteRecord()
    @get('store').commit()
    @transitionToRoute('posts.index')
