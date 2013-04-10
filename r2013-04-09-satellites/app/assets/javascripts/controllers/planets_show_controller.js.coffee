App.PlanetsShowController = Ember.ObjectController.extend
  isNew: false
  newSatellite: ->
    @set 'isNew', true
