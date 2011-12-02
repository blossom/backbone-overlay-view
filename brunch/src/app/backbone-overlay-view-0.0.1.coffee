class exports.OverlayView extends Backbone.View

  className: 'overlay'

  constructor: (options) ->
    @clickedToOpen = false
    if options?.backdrop
      @backdrop = $("<div class=\"overlay-backdrop\"></div>").appendTo("body")
      @backdrop.hide()
    @removeOnHide = if options?.removeOnHide? then options.removeOnHide else true
    super(options)
    @$(@el).attr 'data-overlay-id', new Date().getTime()
    @$(@el).hide()

  show: =>
    # bind click to whole body to close the container when clicking somewhere else
    $("body").on "click", @hideClickHandler
    @showAnimation()
    @showBackdropAnimation() if @backdrop

  hide: =>
    @clickedToOpen = false
    $("body").off "click", @hideClickHandler
    @hideAnimation()
    @hideBackdropAnimation() if @backdrop

  showAnimation: =>
    @$(@el).show()

  showBackdropAnimation: =>
    @backdrop.show()

  hideAnimation: =>
    @$(@el).hide 0, @remove

  hideBackdropAnimation: =>
    @backdrop.hide 0, @removeBackdrop

  remove: =>
    $(@el).remove() if @removeOnHide

  removeBackdrop: =>
    @backdrop.remove() if @removeOnHide

  hideClickHandler: (event) =>
    unless @clickedToOpen
      @clickedToOpen = true
      return
    if @$(@el).is ":visible"
      overlayId = @$(@el).data("overlay-id")
      # do nothing in case user clicked inside the overlay
      if $(event.target).closest("[data-overlay-id=#{overlayId}]")[0] is undefined
        @hide()
