class PartialGenerator

  attr_replace_regex: /(_attributes[\[\]_]{1,2})\d+(?![^\"]*_attributes[\[\]_]{1,2})/g

  constructor: (options) ->
    @partial = options.partial
    @container = options.container
    @form_object = options.form_object

  build: () =>
    partial = @get_partial()
    @update_forms(partial, @form_object)

  create: () =>
    partial = $(@build())
    @insert(partial)
    return partial
    
  insert: (partial) =>
    partial = $(partial)
    $(@container).append(partial)
    $(document).trigger "add_content", [partial]
    return partial

  get_partial: () =>
    try
      $(@partial).outerHTML()
    catch e
      console.error "Could not find the partial #{@partial}"
      console.error e

  #Provide new unique IDs for all inputs to avoid colliding with
  #existing form options for nested attributes
  #Changes: 
  # order[plans_attributes][0][order_details_attributes][0][details][description]
  #To:
  # order[plans_attributes][1329499194124][order_details_attributes][0][details][description]
  #or
  # order[plans_attributes][0][order_details_attributes][1329499194124][details][description]
  update_forms: (form_text, form_object, new_id) =>
    if form_object?
      # Watch for subtle pluralization
      regex = new RegExp("(#{form_object}s_attributes[\\[\\]_]{1,2})\\d+", "g")
    else
      #If no form_object is sent we update the last occurance of _attributes
      regex = new RegExp("(_attributes[\\[\\]_]{1,2})\\d+(?![^\\\"]*_attributes[\\[\\]_]{1,2})", "g")

    new_id ||= @get_new_id()

    if form_text != undefined
      form_text.replace(regex, "$1#{new_id}")
    else
      console.error "PartialGenerator::Could not find the partial in question"

  find_form_id: (form_text, form_object) => 
    if form_object?
      # Watch for subtle pluralization
      regex = new RegExp("#{form_object}s_attributes[\\[\\]_]{1,2}(\\d+)", "g")
    else
      #If no form_object is sent we update the last occurance of _attributes
      regex = new RegExp("_attributes[\\[\\]_]{1,2}(\\d+)(?![^\\\"]*_attributes[\\[\\]_]{1,2})", "g")

    #Return only the match between the brackets
    regex.exec(form_text)[1]

  get_new_id: () ->
    #Returns the number of milliseconds since the epoch
    #guaranteed to be unique for this session
    new Date().getTime()

window.PartialGenerator = PartialGenerator