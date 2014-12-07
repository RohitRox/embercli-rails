`import Ember from 'ember'`
`import startApp from 'cli-app/tests/helpers/start-app'`
`import Ember from 'ember'`

App = null

module 'Integration - Home Page', 
  setup: ->
    App = startApp()
  ,
  teardown: ->
    Ember.run(App, 'destroy')

test 'Should have Welcome text', ->
  visit('/').then ->
    equal(find('h2#title').text(), 'Welcome to Ember.js');

test 'Should have posts link', ->
  visit('/').then ->
    equal(find('a').text(), 'View All Posts');