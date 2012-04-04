class PhoneInput extends Widget
  events: {
    "change": 'update'
  }

  init: () -> 
    @update()
    @remove_error = !@$.closest(".control-group").hasClass("error")


  update: () =>
    numbers = @$.val().replace(/\D/g, "")
    @set_valid(numbers.length >= 10)

    # Hide/show extension
    if numbers.length > 10
      @$.val(numbers.replace(/(\d{0,3})(\d{0,3})(\d{0,4})(\d*)/, "(\$1) $2-$3 x$4"))
    else if numbers.length > 0
      @$.val(numbers.replace(/(\d{0,3})(\d{0,3})(\d{0,4})(\d*)/, "(\$1) $2-$3"))

  set_valid: (status) =>
    @valid = status

    if @valid
      @$.closest(".control-group").removeClass("error")
    else if @remove_error
      @$.closest(".control-group").addClass("error")

window.Widgets.PhoneInput = PhoneInput