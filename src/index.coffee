Vue = require 'vue'

app = new Vue
  el: '#app'
  data:
    title: 'color-vue!'
    message: 'Hello, Vue.js!!'

count = 3
tick = ->
  if count > 0
    app.$data.message = "count = #{count}"
    setTimeout tick, 1000
  else
    app.$data.message = "Vue.js!!!!!"
  count -= 1

setTimeout tick, 1000
