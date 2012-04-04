class PostalInput extends Widget
  events: {
    "change": 'update'
  }

  matcher: /^[A-Z][\d][A-Z] [\d][A-Z][\d]$/

  update: () =>
    result = @$.val().replace(/\W/g, "").toUpperCase()
    @$.val(result.replace(/.*?([A-Z][\d][A-Z])?.*?([\d][A-Z][\d])?.*/, "$1 $2"))
    @set_valid(@$.val().match(@matcher))

  set_valid: (status) =>
    @valid = status

    if @valid
      @$.closest(".control-group").removeClass("error")
    else
      @$.closest(".control-group").addClass("error")

window.Widgets.PostalInput = PostalInput