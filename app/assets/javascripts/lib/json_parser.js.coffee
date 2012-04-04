class JSONParser

  parse: (json_string) ->
    @reformat($.parseJSON(json_string))

  reformat: (json_object) ->
    ret = {}
    for object in json_object
      
      keys = _.keys(object)

      #Rable template
      if keys.length == 1
        type = keys[0]
        item = object[type]
      else #Not a rabl template
        type = "unknown"
        item = object

      id = item.id || -1
      ret[type] ||= {}
      ret[type][id] = item

    return ret

window.Lib ||= {}
window.Lib.JSON ||= new JSONParser()