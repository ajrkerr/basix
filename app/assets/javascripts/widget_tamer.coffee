class WidgetTamer

  constructor: () ->
    #Process on dom-ready
    $(@load)
    $(document).on "add_content", (event, content) =>
      @instantiate_widgets(content)

  load: () =>
    @instantiate_widgets()

  widgets: []

  delete_widgets_from_html: (element) =>
    $(element).find("[data-widgetclass]").each (index, widget_element) =>
      widget = $(widget_element).data("widget")
      widget.destroy() if widget
      delete widget
      
      #Unregister
      @delete_widget(widget)

  delete_widget: (widget) ->
    index = $.inArray(widget, @widgets)
    @widgets.splice(index, 1) if index != -1
    return (index != -1)

  instantiate_widgets: (context = 'body') ->  
    if $(context).is("[data-widgetclass]")
      @_instantiate_widgets(context)

    $("[data-widgetclass]", context).each (index, element) =>
      @_instantiate_widgets(element)

  _instantiate_widgets: (element) ->
    widget_classes = $(element).attr("data-widgetclass").split(" ")

    #Stop the creating of any subwidgets to prevent widgets
    #from being instantiated multiple times
    widget_options = { auto_subwidgets: false }

    for widget_class in widget_classes
      @create_widget(widget_class, element, widget_options)

  create_widget: (widget_class, element, widget_options) =>
    console.log("Building Widget: #{widget_class}") if console?
    widget = new Widgets[widget_class](element, widget_options)
    @widgets.push(widget)
    return widget

  create: (opts...) =>
    @create_widget opts...

window.WidgetTamer = new WidgetTamer()