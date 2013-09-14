genericOnClick = (info, tab) -> 
  tab_url = "search.html##{info.srcUrl}##{info.menuItemId}"
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

