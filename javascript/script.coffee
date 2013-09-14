genericOnClick = (info, tab) ->
  #console.log("item #{info.menuItemId} was clicked")
  console.log("info: #{JSON.stringify(info)}")
 
  if "#{info.menuItemId}" == "search_largest"
    tab_url = "search.html##{info.srcUrl}"
  else if "#{info.menuItemId}" == "search_google"
    tab_url = "search.html##{info.srcUrl}" 

  chrome.tabs.create {
    url: tab_url
  }
    

chrome.contextMenus.create {
  "id": "search_largest"
  "title": "Get Largest Same image on Google"
  "contexts": ["image"]
  "onclick": genericOnClick
}

chrome.contextMenus.create {
  "id": "search_google"
  "title": "Search Same image on Google"
  "contexts": ["image"]
  "onclick": genericOnClick
}

