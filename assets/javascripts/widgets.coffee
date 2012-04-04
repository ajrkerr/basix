#= require_self
#= require_tree ./widgets

class Widget
  constructor: (@element, options = {}) ->
    @_set_element()
    @_get_data_attrs(options.data)
    @_validate_data_attrs()
    @_set_widget_options(options)
    @_setup_events()
    @_setup_subwidgets() if options['auto_subwidgets']
    @init(options)

  destroy: () =>
    #Clear subwidgets
    WidgetTamer.delete_widgets_from_html(@$)

    #Boom goes the dynamite
    @$.remove()

  #Empty init function for overriding
  init: ->

  _widget_options: {
    'auto_subwidgets': true
  }

  _set_element: ->
    @$ ||= $(@element)
    @$.data("widget", @)

  ###
  # Validates and sets Data Attributes
  # data_attrs: ['requestpartial']
  # Widget: <a href="/" data-request-partial="something">Text</a>
  ###
  data_attrs: []

  _validate_data_attrs: ->
    for attr_name in @data_attrs
      data_attr = "data-#{attr_name}"
      console.warn("Could not find '#{data_attr}' in #{@$}") unless @[attr_name]?

  _get_data_attrs: (override) ->
    for attr_name in @data_attrs
      if override?
        @[attr_name] = override[attr_name]
      else
        @[attr_name] = @$.attr("data-#{attr_name}")  


  _set_widget_options: (options) ->
    @widget_options = {}
    $.extend(@widget_options, @_widget_options, options)    

  #Configures events from event hash in the format of:
  #events: {
  #  'event selector': 'function_name',
  #  'click a.link': 'show_something' 
  #}
  _setup_events: () ->
    @_setup_event event, callback for event, callback of @events 
    
  # Events are in the format of:
  # event selector
  _setup_event: (event, callback) ->
    [event, selectors...] = event.split(' ')

    throw "Could not find function #{callback}" unless @[callback]?
    console.log "Binding #{event} on #{selectors.join(' ')}"
    #If selector is empty, bind the event to the widget body
    if selectors.length > 0
      @$.on(event, selectors.join(' '), @[callback])
    else
      @$.on(event, @[callback])
    

  _setup_subwidgets: () ->
    WidgetTamer.instantiate_widgets(@$)

window.Widget = Widget
window.Widgets = {}