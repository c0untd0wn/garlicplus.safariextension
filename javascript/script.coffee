genericOnClick = (info, tab) ->
  console.log("item #{info.menuItemId} was clicked")
  console.log("info: #{JSON.stringify(info)}")
  console.log("tab: #{JSON.stringify(tab)}")
  chrome.tabs.create {
    url: "popup.html"
  }

id = chrome.contextMenus.create {
  "title": "Test context menu item"
  "contexts": ["image"]
  "onclick": genericOnClick
}

console.log "context : #{id}"
console.log "Hello World!"
