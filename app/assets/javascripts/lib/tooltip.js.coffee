class Tooltip
  constructor: (text, element, options) ->
    options.trigger = "manual" if options.permanent

    $element = $(element)
    $element.tooltip(options)
    $element.tooltip('show') if options.permanent


window.Tooltip = Tooltip