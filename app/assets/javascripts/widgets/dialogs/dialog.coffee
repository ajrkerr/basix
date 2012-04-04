class Dialog extends Widget
  #Override Constructor because we expect there to be 
  #dialog classes overriding this
  constructor: (@element, options) ->
    @_set_element()
    @_find_title()
    @_wrap_elements()
    @_extend_dialog_options(options)
    @_create_dialog()
    super
    @open()

  dialog_options: {
    modal: true,
    autoOpen: false,
    width: "auto"
  }

  events: {
    # 'ajax:success form': 'close'
  }

  close: () =>
    @dialog.dialog('close')
  
  open: () =>
    @dialog.dialog('open')

  _find_title: () ->
    title = @$.closest(".title").first().hide().text()
    @dialog_options['title'] ||= title

  #Wraps the elements, allowing them to be searched by the WidgetTamer
  # in order to instantiate subwidgets that may appear in the root
  # of the DOM tree
  _wrap_elements: ->
    @$ = $("<div>").append(@$)

  _create_dialog: () ->
    @dialog = @$.dialog(@dialog_options)

  _extend_dialog_options: (options) ->
    $.extend(@dialog_options, options)

window.Widgets.Dialog = Dialog