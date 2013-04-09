App.Planet = DS.Model.extend
  name: DS.attr 'string'
  image: DS.attr 'string'
  satellites: DS.hasMany 'App.Satellite'
