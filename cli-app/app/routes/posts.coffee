`import Ember from 'ember'`

PostsRoute = Ember.Route.extend
  model: ->
    @store.find 'post'

`export default PostsRoute`
