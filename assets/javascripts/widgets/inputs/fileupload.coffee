class FileUpload extends Widget
  init: () ->

  #Is this event delegation?
  events: {
    "change .new_file form": "add_file",
    "click .selected_files .remove": "remove_file",
    "click .button.upload": "upload_files",
    "ajax:beforeSend form": "before_upload",
    "ajax:success form"   : "upload_success",
    "ajax:failure form"   : "upload_failure",
    "ajax:complete form"  : "upload_complete",
  }

  remove_file: (event) =>
    $(event.target).closest("form").fadeOut().remove()

  add_file: (event) =>
    form = $(event.target).closest("form")
    new_form = form.clone()
    selected_files = @$.children('.selected_files')
    remove_link = @new_remove_link()

    @replace_filename(form)
    form.detach().append(remove_link).appendTo(selected_files)
    @$.find(".new_file").append(new_form)

  new_remove_link: (event) =>
    $("<span>").addClass("remove")

  replace_filename: (form) =>
    field = form.find("input[type=file]")
    filename = @get_filename(field)

    $("<span>").append(filename).appendTo(form)

  get_filename: (input) =>
    filename = $(input).val()
    filename = filename.substring(filename.lastIndexOf('/') + 1, filename.length)
    filename = filename.substring(filename.lastIndexOf('\\') + 1, filename.length)

  upload_files: (event) =>
    $(event.target).attr('disabled', 'disabled')
    forms = @$.find(".selected_files form:not(.ajax-in-progress, .success)")

    forms.each (index, form) ->
      $(form).submit()

    $(event.target).removeAttr('disabled')

  before_upload: (event) =>
    $(event.target).attr('disabled', 'disabled')
    $(event.target).addClass('ajax-in-progress')

  upload_success: (event, data) =>
    $(event.target).addClass('success')

  upload_failure: (event) =>
    $(event.target).addClass('failure')

  upload_complete: (event) =>
    $(event.target).removeAttr('disabled')
    $(event.target).removeClass('ajax-in-progress')


window.Widgets.FileUpload = FileUpload