class NewButton extends Widgets.Button
  events: {
    'ajax:success a': 'show_result'
  }

  show_result: (event, data, xhr, status) =>
    new Widgets.Dialog(data.partial)

window.Widgets.Buttons.New = NewButton
