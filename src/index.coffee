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

tick = ->
  app.decriment()
  setTimeout(tick, 1000) if app.count > 0
setTimeout tick, 1000

app.$mount '#app'
