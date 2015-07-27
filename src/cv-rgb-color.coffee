tinycolor = require 'tinycolor2'

module.exports =
  props: ['color']
  template: '''
    <div
      class="rgb-color"
      v-text="rgbColor"
      >
    </div>
  '''
  computed:
    rgbColor: ->
      color = tinycolor @color
      color.toRgbString()
