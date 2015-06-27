
$ -> 
  appName = $("meta[property='og:title']").attr("content")

  $("#download-ios a").click ->
    ga("send", "appstore", "badge", "click", appName)

  $("#download-android a").click ->
    ga("send", "googleplay", "badge", "click", appName)
