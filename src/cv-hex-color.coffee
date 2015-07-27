tinycolor = require 'tinycolor2'

module.exports =
  props: ['color']
  template: '''
    <div
      class="hex-color"
      v-text="hexColor"
      >
    </div>
  '''
  computed:
    hexColor: ->
      color = tinycolor @color
      color.toHexString()
