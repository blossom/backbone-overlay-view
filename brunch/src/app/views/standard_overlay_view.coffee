class exports.StandardOverlayView extends Backbone.OverlayView

  initialize: (options) =>
    @template = require 'templates/standard_overlay'

  render: =>
    @$(@el).html @template()
    @
