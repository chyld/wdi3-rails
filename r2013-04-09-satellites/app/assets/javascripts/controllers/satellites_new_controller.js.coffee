App.SatellitesNewController = Ember.ObjectController.extend
  needs: ['planetsShow']
  cancel: ->
    @get('controllers').get('planetsShow').set('isNew', false)
    @transitionToRoute('planets.index')
  save: ->
    satellite = @get('content')
    @get('controllers').get('planetsShow').get('satellites').pushObject(satellite)
    @get('controllers').get('planetsShow').set('isNew', false)
    @get('store').commit()
    @transitionToRoute('planets.index')
