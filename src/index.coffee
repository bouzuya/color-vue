Vue = require 'vue'

app = new Vue
  data:
    count: 3
    title: 'color-vue!'
  # TODO: props:
  methods:
    decriment: ->
      @count -= 1
  computed:
    message: ->
      return 'Vue.js!!!!!' if @count is 0
      "count = #{@count}"
  template: '''
    <div class="app">
      <h1 v-text="title"></h1>
      <p v-text="message"></p>
    </div>
  '''
  replace: true # default: true
  created: ->
    console.log 'on created'
  beforeCompile: ->
    console.log 'on before compile'
  compiled: ->
    console.log 'on compiled'
  ready: ->
    console.log 'on ready'
  attached: ->
    console.log 'on attached'
  detached: ->
    console.log 'on detached'
  beforeDestroy: ->
    console.log 'on before destroy'
  destroyed: ->
    console.log 'on destroyed'
  inherit: false # default: false
  events:
    'hook:created': ->
      console.log 'on created(event)'
    ping: (message) ->
      console.log 'PONG' + message
  watch:
    count: (newValue, oldValue) ->
      console.log "count: #{oldValue} -> #{newValue}"
  mixins: [
    created: ->
      console.log 'mixin 1 created'
  ,
    created: ->
      console.log 'mixin 2 created'
  ]
  # TODO: name

app.$emit 'ping', '!'

tick = ->
  app.decriment()
  setTimeout(tick, 1000) if app.count > 0
setTimeout tick, 1000

app.$mount '#app'
