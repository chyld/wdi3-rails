App.PostsShowController = Ember.ObjectController.extend
  isEditing: false
  edit: ->
    @set 'isEditing', true
  save: ->
    @set 'isEditing', false
    @get('store').commit()
