window.App = Ember.Application.create
  LOG_TRANSITIONS: true

App.Router.map ->
  @route 'about'
  @route 'faq'
  @resource 'posts', ->
    @route 'show', {path: ':post_id'}
    @route 'new'

App.Store = DS.Store.extend
  revision: 12
