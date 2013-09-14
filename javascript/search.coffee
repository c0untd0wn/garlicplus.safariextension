console.log "Hello Search!"

hash = window.location.hash.split("#")[1]
console.log hash

default_search = "https://www.google.com/searchbyimage?safe=off&hl=ko&site=search&image_url=#{hash}"
  #http://xbox-360.mediagen.fr/red-dead-redemption-xbox-ps3-4_019401C700007820.jpg"

searchImage = () ->
  console.log(this)
  if this.readyState == 4
    link_dom = $(this.responseText).find(".qb-mslc .gl a")[0]

    if link_dom
      link_href = link_dom.href
      link_href_arr = link_href.split("/")
      link = "https://www.google.com/" + link_href_arr[link_href_arr.length-1] + "&dpr=1"
      console.log(link)
      window.location = link
      #runXHR(link, searchAllSizeImage)  
    else
      console.log('no image')

searchAllSizeImage = () ->
  console.log(this)
  if this.readyState == 4
    console.log(this)


runXHR = (url, callback) ->
  xhr = new XMLHttpRequest()
  xhr.onreadystatechange = callback
  xhr.open("GET", url, true)
  xhr.send()


#Search Image Page
runXHR(default_search, searchImage)
