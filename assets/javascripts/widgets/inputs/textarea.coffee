class TextArea extends Widget
  init: (options) ->
    @$.autoResize({
      minHeight: "original",
      extraSpace: 0,
      animate: false
    })

window.Widgets.TextArea = TextArea