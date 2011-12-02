class exports.RerenderOverlayView extends Backbone.OverlayView

  events:
    "click #roll-the-dice": "rerender"

  initialize: (options) =>
    @template = require 'templates/rerender_overlay'

  rerender: (event) =>
    # edge case
    # We don't want to let the event propagate to body, because it would remove the div.
    # This happens because of rerendering the event.target is removed from dom
    # and by this it can't find the overlay div in the ancestor chain.
    event.preventDefault()
    event.stopPropagation()
    @render()

  render: =>
    @$(@el).html @template()
    @
