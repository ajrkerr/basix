add_field_tooltips = (context) ->
  $("li.input", context).each (index, element) -> 
    $element = $(element)
    $inputs = $(element).children("input, textarea, select")
    $hint = $element.children("p.inline-hints")

    title = $hint.text()
    placement = $inputs.first().attr("placement") || "right"
    trigger = $inputs.first().attr("trigger") || "default"

    #Show on form active or hover
    if trigger == "default"
      $inputs.on(
        "focus.tooltip": (event) ->
          $target = $(event.currentTarget)
          $target.tooltip('show') unless $target.is(':hover')
        "mouseenter.tooltip": (event) ->
          $target = $(event.currentTarget)
          $target.tooltip('show') unless $target.is(':focus')
        "blur.tooltip": (event) ->
          $target = $(event.currentTarget)
          $target.tooltip('hide') unless $target.is(':hover')
        "mouseleave.tooltip": (event) ->
          $target = $(event.currentTarget)
          $target.tooltip('hide') unless $target.is(':focus')
      )

      trigger = "manual"

    #Show always
    if trigger == "permanent"
      permanent = true
      trigger = "manual"

    if title?
      $tooltip = $inputs.tooltip({
        title: title
        placement: placement
        trigger: trigger
      })

      $tooltip.tooltip("show") if permanent
  

# Add tooltips to inputs
$ -> 
  #Add them on start
  add_field_tooltips(document)

  #Add them to any element that is added
  $(document).on "add_content", (event, content) ->
    add_field_tooltips(content)

  $("input", "textarea").placeholder()
