class exports.BackdropOverlayView extends Backbone.OverlayView

  initialize: (options) =>
    @template = require 'templates/backdrop_overlay'

  render: =>
    @$(@el).html @template()
    @

