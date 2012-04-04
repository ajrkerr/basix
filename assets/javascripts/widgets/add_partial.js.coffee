class AddPartial extends Widget
  init: () ->
    options = {
      container: @container
      partial: @partial
    }
    @generator = new PartialGenerator(options)

    @set_tooltip() if @tooltip?

  events: {
    "click": "add_partial"
  }

  data_attrs: [
    'partial', 'container', 'tooltip'
  ]

  add_partial: () =>
    @generator.create()

  set_tooltip: () ->
    @$.data('tooltip', null)
    @$.tooltip( {title: @tooltip, placement: 'right'} )


window.Widgets.AddPartial = AddPartial