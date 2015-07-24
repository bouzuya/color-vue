Vue = require 'vue'

data =
  title: 'color-vue!'
  message: 'Hello, Vue.js!!'
app = new Vue { data }

# Vue constructor data = instance $data
console.log app.$data is data

count = 3
tick = ->
  if count > 0
    app.$data.message = "count = #{count}"
    setTimeout tick, 1000
  else
    # data proxy (app.$data.message <- app.message)
    app.message = "Vue.js!!!!!"
  count -= 1

setTimeout tick, 1000

app.$mount '#app'
