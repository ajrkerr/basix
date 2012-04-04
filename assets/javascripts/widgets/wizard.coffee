class Wizard extends Widget

  events: {
    "submit": 'allow_change'
  }

  confirm_message: "You are about to leave and your changes will be lost."
  can_change: false

  allow_change: () =>
    @can_change = true

  init: () ->
    $(window).on "beforeunload", @changepage

  changepage: (event) =>
    return @confirm_message unless @can_change

window.Widgets.Wizard = Wizard