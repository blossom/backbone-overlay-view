window.app = {}
app.routers = {}
app.models = {}
app.collections = {}
app.views = {}

{OverlayView} = require "backbone-overlay-view-0.0.1"
Backbone.OverlayView = OverlayView

MainRouter = require('routers/main_router').MainRouter
HomeView = require('views/home_view').HomeView

# app bootstrapping on document ready
$(document).ready ->
  app.initialize = ->
    app.routers.main = new MainRouter()
    app.views.home = new HomeView()
    app.routers.main.navigate 'home', true if Backbone.history.getFragment() is ''
  app.initialize()
  Backbone.history.start()
