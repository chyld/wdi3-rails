App.PlanetsRoute = Ember.Route.extend
  model: -> App.Planet.find()
