
injectIntoPage = (element) ->
    (document.head or document.documentElement).appendChild element

injectScript = (url) ->
    script = document.createElement 'script'
    script.src = url
    script.type = 'text/javascript'
    injectIntoPage script

getInjectionURL = (fileName) ->
    chrome.extension.getURL "javascripts/#{fileName}.js" +
    "?nocache=#{new Date().getTime()}"

window.Injector = {
    injectScript
}
