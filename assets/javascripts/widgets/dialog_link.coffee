class DialogLink extends Widget
  events: {
    'ajax:beforeSend': 'before_send',
    'click': 'clicked'
  }

  data_attrs: [
    'requestpartial'
  ]

  init: () ->
    @url = @$.attr('href')

  clicked: (event, data, status, xhr) =>
    ViewStation.get(@requestpartial, @url, @show_dialog)

  show_dialog: (dialog) ->
    new Widgets.Dialog(dialog)

  before_send: (event, xhr, settings) ->
    false

window.Widgets.DialogLink = DialogLink