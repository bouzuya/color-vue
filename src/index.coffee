Vue = require 'vue'
cvHexColor = require './cv-hex-color'
cvRgbColor = require './cv-rgb-color'

Vue.config.strict = true
Vue.config.interpolate = false

new Vue
  el: 'title'
  data: ->
    title: 'color-vue!'
  template: '''
    <title v-text="title"></title>
  '''

new Vue
  el: '#app'
  data: ->
    color: '#000000'
    title: 'color-vue'
  template: '''
    <div class="app">
      <h1 v-text="title"></h1>
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
  components:
    'cv-hex-color': cvHexColor
    'cv-rgb-color': cvRgbColor
