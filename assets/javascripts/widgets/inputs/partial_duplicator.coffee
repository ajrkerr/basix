class PartialDuplicator extends Widget
  events: {
    "click .add_partial": 'add_partial',
    "click .remove_partial": 'remove_partial'
  }

  init: ->
    @generator = new PartialGenerator {
      partial: @$.find(".partial_template"),
      container: @$.find(".partial_container")
    }

  add_partial: =>
    partial = @generator.create()
    $(partial).find("input").val("")

  remove_partial: (event) =>
    $(event.target).closest(".partial_template").remove()


window.Widgets.PartialDuplicator = PartialDuplicator