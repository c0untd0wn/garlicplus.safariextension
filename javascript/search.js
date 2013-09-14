(function() {
  var default_search, hash, runXHR, searchAllSizeImage, searchImage;

  console.log("Hello Search!");

  hash = window.location.hash.split("#")[1];

  console.log(hash);

  default_search = "https://www.google.com/searchbyimage?safe=off&hl=ko&site=search&image_url=" + hash;

  searchImage = function() {
    var link, link_dom, link_href, link_href_arr;
    console.log(this);
    if (this.readyState === 4) {
      link_dom = $(this.responseText).find(".qb-mslc .gl a")[0];
      if (link_dom) {
        link_href = link_dom.href;
        link_href_arr = link_href.split("/");
        link = "https://www.google.com/" + link_href_arr[link_href_arr.length - 1] + "&dpr=1";
        console.log(link);
        return window.location = link;
      } else {
        return console.log('no image');
      }
    }
  };

  searchAllSizeImage = function() {
    console.log(this);
    if (this.readyState === 4) {
      return console.log(this);
    }
  };

  runXHR = function(url, callback) {
    var xhr;
    xhr = new XMLHttpRequest();
    xhr.onreadystatechange = callback;
    xhr.open("GET", url, true);
    return xhr.send();
  };

  runXHR(default_search, searchImage);

}).call(this);
