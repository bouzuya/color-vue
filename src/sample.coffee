Vue = require 'vue'
cvHexColor = require './cv-hex-color'
cvRgbColor = require './cv-rgb-color'

Vue.config.debug = true
Vue.config.strict = true
Vue.config.interpolate = false

app = new Vue
  data: ->
    color: '#000000'
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
      {{message}}
      <hr />
      <label>color</label>
      <input
        type="text"
        v-model="color"
        />
      <span class="color-sample" v-style="{ color: color }">■</span>
      <cv-hex-color color="{{color}}">
      </cv-hex-color>
      <cv-rgb-color color="{{color}}">
      </cv-rgb-color>
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
  components:
    'cv-hex-color': cvHexColor
    'cv-rgb-color': cvRgbColor
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

# instance properties
console.log app.$el
console.log app.$data
console.log app.$option
console.log app.$parent
console.log app.$root
console.log app.$children
console.log app.$
console.log app.$$

# instance methods
unwatch = app.$watch 'count', (newValue, oldValue) ->
  console.log "$watch count: #{oldValue} -> #{newValue}"
  unwatch() if newValue is 1

# $get / $set
console.log app.newCount
# "[Vue warn]: You are setting a non-existent path "newCount" on a vm instance.
# Consider pre-initializing the property with the "data" option for more
# reliable reactivity and better performance."
app.$set 'newCount', 5
console.log app.$get 'newCount'
console.log app.newCount

# TODO: $add / $delete

# $eval
console.log app.$eval 'title | uppercase'

console.log app.$log()
