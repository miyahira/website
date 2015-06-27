
$ -> 
  appName = $("meta[property='og:title']").attr("content")

  $("#download-ios a").click ->
    ga("send", "event", "appstore", "click", appName)

  $("#download-android a").click ->
    ga("send", "event", "googleplay", "click", appName)
