img_url = window.location.hash.split("#")[1]
menu_id = window.location.hash.split("#")[2]

#search_url = "https://www.google.com/searchbyimage?safe=off&hl=ko&site=search&image_url=#{img_url}"
search_url = "https://www.google.com/searchbyimage?newwindow=1&biw=1350&bih=628&site=search&image_url=#{img_url}&sa=X&ei=ukE0Up60CseFiQeH9ID4CA&ved=0CCcQ9Q8oAA"

searchImage = () ->
  if this.readyState == 4
    link_dom = $(this.responseText).find(".qb-mslc .gl a")[0]

    if link_dom
      link_href = link_dom.href
      link_href_arr = link_href.split("/")
      link = "https://www.google.com/" + link_href_arr[link_href_arr.length-1]
      console.log(link)

      if menu_id == "search_largest" or menu_id == "download_largest"
        runXHR(link, searchAllSizeImage)
      else if menu_id == "search_google"
        window.location.replace(link)
    else
      $("#img_loading").hide()
      $("#img_progress").html("Sorry! No Image Found!")

searchAllSizeImage = () ->
  if this.readyState == 4
    elem = $(this.responseText).find(".rg_di > a").first().attr("href")
    imageUrl = getQueryVariable(elem)

    if menu_id == "search_largest"
      window.location.replace(imageUrl)
    else if menu_id == "download_largest"
      chrome.downloads.download {
        "url": imageUrl
        "saveAs": true
      }, () ->
        window.location.replace(imageUrl)
        


getQueryVariable = (query) ->
  vars = query.split("&")

  for arg in vars
    argval = arg.split("=")
    return argval[1] if argval[0] == "imgurl"


runXHR = (url, callback) ->
  xhr = new XMLHttpRequest()
  xhr.onreadystatechange = callback
  xhr.open("GET", url, true)
  xhr.send()


#Search Image Page
$(document).ready ->
  $("#img_div").html("<img src='" + img_url + "' />")
  runXHR(search_url, searchImage)
