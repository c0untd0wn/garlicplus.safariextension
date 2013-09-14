genericOnClick = (info, tab) ->
  console.log("item #{item.menuItemId} was clicked")
  console.log("info: #{JSON.stringify(info)}")
  console.log("tab: #{JSON.stringify(tab)}")

id = chrome.contextMenus.create {
  "title": "Test context menu item"
  "contexts": ["image"]
  "onclick": genericOnClick
}

console.log "context : #{id}"
console.log "Hello World!"
