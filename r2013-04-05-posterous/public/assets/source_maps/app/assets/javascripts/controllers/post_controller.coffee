App.PostController = Ember.ObjectController.extend
  isEditing: false
  edit: ->
    this.set 'isEditing', true
  doneEditing: ->
    this.set 'isEditing', false
    this.get('store').commit()

