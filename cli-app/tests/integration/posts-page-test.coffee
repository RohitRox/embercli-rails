`import Ember from 'ember'`
`import startApp from 'cli-app/tests/helpers/start-app'`
`import Ember from 'ember'`
`import Pretender from 'pretender'`

App = null

module 'Integration - Posts Page', 
  setup: ->
    App = startApp()
    posts = [
      {
        id: 1,
        title: 'Posts 1'
      },
      {
        id: 2,
        title: 'Posts 2'
      }
    ]
    server = new Pretender ->
      @get '/api/posts', (request) ->
        [200, {"Content-Type": "application/json"}, JSON.stringify({posts: posts})]
  ,
  teardown: ->
    Ember.run(App, 'destroy')

test 'Should display posts', ->
  visit('/').then ->
    click('a').then ->
      equal(find('h3').text(), 'Listing All Posts:');
      equal(find('li:contains("Posts 1")').length, 1);
      equal(find('li:contains("Posts 2")').length, 1);
