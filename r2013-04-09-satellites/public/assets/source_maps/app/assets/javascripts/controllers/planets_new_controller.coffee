App.PlanetsNewController = Ember.ObjectController.extend
  save: ->
    @get('store').commit()
    @transitionToRoute('planets.index')
  cancel: ->
    @transitionToRoute('planets.index')
