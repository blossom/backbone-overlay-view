homeTemplate = require('templates/home')

{StandardOverlayView} = require 'views/standard_overlay_view'
{BackdropOverlayView} = require 'views/backdrop_overlay_view'
{FadeOverlayView} = require 'views/fade_overlay_view'
{RerenderOverlayView} = require 'views/rerender_overlay_view'

class exports.HomeView extends Backbone.View
  id: 'home-view'

  events:
    "click #open-standard-overlay": "openStandardOverlay"
    "click #open-backdrop-overlay": "openBackdropOverlay"
    "click #open-fade-overlay": "openFadeOverlay"
    "click #open-rerender-overlay": "openRerenderOverlay"

  initialize: =>
    @rerenderOverlay = new RerenderOverlayView {id: "rerender-overlay", removeOnHide: false}

  render: =>
    @$(@el).html homeTemplate()
    @$(@el).append @rerenderOverlay.el
    @

  openStandardOverlay: (event) =>
    event.preventDefault()
    overlay = new StandardOverlayView {id: "standard-overlay"}
    @$(@el).append overlay.render().el
    overlay.show()

  openBackdropOverlay: (event) =>
    event.preventDefault()
    overlay = new BackdropOverlayView {id: "backdrop-overlay", backdrop: true}
    @$(@el).append overlay.render().el
    overlay.show()

  openFadeOverlay: (event) =>
    event.preventDefault()
    overlay = new FadeOverlayView {id: "fade-overlay", backdrop: true}
    @$(@el).append overlay.render().el
    overlay.show()

  openRerenderOverlay: (event) =>
    event.preventDefault()
    @rerenderOverlay.render()
    @rerenderOverlay.show()
