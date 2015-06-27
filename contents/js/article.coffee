appName = $("meta[property='og:title']").attr("content")

$("#download-ios a").click ->
  ga("send", "appstore", "badge", "click", appName)

$("#download-ios a").click ->
  ga("send", "googleplay", "badge", "click", appName)
