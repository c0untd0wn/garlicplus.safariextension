$ ->
  getQueryVariable = (query) ->
    vars = query.split("&")

    for arg in vars
      argval = arg.split("=")
      return argval[1] if argval[0] == "imgurl"

  elem = $(".rg_di > a").first().attr("href")
  console.log elem
  imageUrl = getQueryVariable(elem)

  window.location.replace(imageUrl)

  #$.get imageUrl, (data) ->
    #console.log data



  #$(".rg_di > a").each (k, v) ->
    #a = $(v).attr("href")
    #console.log a
