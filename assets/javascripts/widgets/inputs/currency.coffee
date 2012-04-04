class CurrencyInput extends Widget
  events: {
    'change': 'update'
  }

  init: () ->
    @update()

  update: () =>
    @$.formatCurrency()

window.Widgets.CurrencyInput = CurrencyInput