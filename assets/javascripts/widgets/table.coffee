class Table extends Widget
  data_attrs: [
    'model', 'partial'
  ]

  init: ->
    @body = @$.children("tbody")
    @head = @$.children("thead")

    model = @tablemodel
    partial = @requestpartial
    # url = @requesturl

    ViewStation.on_create partial, model, @add_row

  add_row: (row) =>
    $(row).addClass("new").appendTo(@body)

window.Widgets.Table = Table