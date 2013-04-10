App.PlanetsShowController = Ember.ObjectController.extend
  needs: ['satellitesNew']
  isNew: false
  newSatellite: ->
    @set 'isNew', true
    @get('controllers').get('satellitesNew').set('content', App.Satellite.createRecord())
