Vue = require 'vue'

data =
  count: 3
  title: 'color-vue!'
  message: 'Hello, Vue.js!!'
app = new Vue {
  data
  # TODO: props:
  methods:
    decriment: ->
      @count -= 1
}

# Vue constructor data = instance $data
console.log app.$data is data

tick = ->
  if app.count > 0
    app.$data.message = "count = #{app.count}"
    setTimeout tick, 1000
  else
    # data proxy (app.$data.message <- app.message)
    app.message = "Vue.js!!!!!"
  app.decriment()

setTimeout tick, 1000

app.$mount '#app'
