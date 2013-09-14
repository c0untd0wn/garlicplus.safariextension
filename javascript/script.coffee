genericOnClick = (info, tab) -> 
  tab_url = "search.html##{info.srcUrl}##{info.menuItemId}"
  chrome.tabs.create {
    url: tab_url
  }
    

chrome.contextMenus.create {
  "id": "search_largest"
  "title": "Open Largest Same image on Google"
  "contexts": ["image"]
  "onclick": genericOnClick
}

chrome.contextMenus.create {
  "id": "download_largest"
  "title": "Download Largest Same image on Google"
  "contexts": ["image"]
  "onclick": genericOnClick
}

chrome.contextMenus.create {
  "id": "search_google"
  "title": "Search Same images with Different size on Google"
  "contexts": ["image"]
  "onclick": genericOnClick
}

