App.PlanetsNewRoute = Ember.Route.extend
  model: -> App.Planet.createRecord()
