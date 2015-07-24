Vue = require 'vue'

data =
  count: 3
  title: 'color-vue!'
app = new Vue {
  data
  # TODO: props:
  methods:
    decriment: ->
      @count -= 1
  computed:
    message: ->
      return 'Vue.js!!!!!' if @count is 0
      "count = #{@count}"
}

# Vue constructor data = instance $data
console.log app.$data is data

tick = ->
  app.decriment()
  setTimeout(tick, 1000) if app.count > 0
setTimeout tick, 1000

app.$mount '#app'
