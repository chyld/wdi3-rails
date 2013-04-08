App.Post = DS.Model.extend
  title: DS.attr 'string'
  author: DS.attr 'string'
  body: DS.attr 'string'
  posted: DS.attr 'date'
