class Tooltip extends Widget
  data_attrs: [
    'tooltip', 'position', 'trigger', 'message', 'permanent'
  ]

  init: () ->  
    options = {
      position: @position || 'right'
      title: @message
      trigger: @trigger
      permanent: @permanent
    }

    @tooltip = new window.Tooltip(@tooltip, @element, options)

  destroy: () =>
    @$.tooltip("hide")


window.Widgets.Tooltip = Tooltip