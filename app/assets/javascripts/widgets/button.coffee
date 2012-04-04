class Button extends Widget
  events: {
    'ajax:success a': 'clicked'
  }

  #Overrides constructor as it expects to be overriden in turn
  constructor: (@element, options) ->
    @_set_element()
    @_find_type()
    super

  clicked: (event, data, status, xhr) ->
    new Widgets.Dialog(data.partial) if data.partial?

  error: (event, xhr, status, error) ->
    alert("Could not communicate with server.")

  _find_type: ->
    @_type = @$.attr('data-buttontype')

window.Widgets.Button = Button
window.Widgets.Buttons = {}