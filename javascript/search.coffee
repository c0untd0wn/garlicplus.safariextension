img_url = window.location.hash.split("#")[1]
menu_id = window.location.hash.split("#")[2]

search_url = "https://www.google.com/searchbyimage?safe=off&hl=ko&site=search&image_url=#{img_url}"
  
searchImage = () ->
  if this.readyState == 4
    link_dom = $(this.responseText).find(".qb-mslc .gl a")[0]

    if link_dom
      link_href = link_dom.href
      link_href_arr = link_href.split("/")
      link = "https://www.google.com/" + link_href_arr[link_href_arr.length-1] + "&garlicplus=" + menu_id

      console.log(link)
      window.location = link
    else
      $("#img_loading").hide()
      $("#img_progress").html("Sorry! No Image Found!")


runXHR = (url, callback) ->
  xhr = new XMLHttpRequest()
  xhr.onreadystatechange = callback
  xhr.open("GET", url, true)
  xhr.send()


#Search Image Page
$(document).ready ->
  $("#img_div").html("<img src='" + img_url + "' />")
  runXHR(search_url, searchImage)
