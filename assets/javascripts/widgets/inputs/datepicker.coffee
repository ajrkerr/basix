class DatePicker extends Widget
  init: (options) ->
    @$.datepicker(@get_options())

  get_options: ->
    {
      dateFormat: @get_date_format() 
    }

  get_date_format: ->
    @$.attr("placeholder")

window.Widgets.DatePicker = DatePicker