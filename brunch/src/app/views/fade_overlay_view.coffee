class exports.FadeOverlayView extends Backbone.OverlayView

  initialize: (options) =>
    @template = require 'templates/fade_overlay'

  render: =>
    @$(@el).html @template()
    @

  showAnimation: =>
    @$(@el).fadeIn(300)

  showBackdropAnimation: =>
    @backdrop.fadeIn(300)

  hideAnimation: =>
    @$(@el).fadeOut(300, @remove)

  hideBackdropAnimation: =>
    @backdrop.fadeOut(300, @removeBackdrop)
