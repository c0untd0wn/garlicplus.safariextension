﻿(function() {
  var img_url, runXHR, searchImage, search_url;

  img_url = window.location.hash.split("#")[1];

  search_url = "https://www.google.com/searchbyimage?safe=off&hl=ko&site=search&image_url=" + img_url;

  searchImage = function() {
    var link, link_dom, link_href, link_href_arr;
    if (this.readyState === 4) {
      link_dom = $(this.responseText).find(".qb-mslc .gl a")[0];
      if (link_dom) {
        link_href = link_dom.href;
        link_href_arr = link_href.split("/");
        link = "https://www.google.com/" + link_href_arr[link_href_arr.length - 1] + "&garlicplus=true";
        console.log(link);
        return window.location = link;
      } else {
        return dom_img_progress.html("No Image Found!");
      }
    }
  };

  runXHR = function(url, callback) {
    var xhr;
    xhr = new XMLHttpRequest();
    xhr.onreadystatechange = callback;
    xhr.open("GET", url, true);
    return xhr.send();
  };

  $(document).ready(function() {
    $("#img_div").html("<img src='" + img_url + "' />");
    return runXHR(search_url, searchImage);
  });

}).call(this);
