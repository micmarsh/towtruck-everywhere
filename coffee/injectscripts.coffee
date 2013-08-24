
injectIntoPage = (element) ->
    (document.head or document.documentElement).appendChild element

injectScript = (url) ->
    script = document.createElement 'script'
    script.src = url
    script.type = 'text/javascript'
    injectIntoPage script

injectData = (key, value) ->
    div = document.createElement 'div'
    div.innerHTML = makeData key, value
    div.className = "readerInjectedData"
    injectIntoPage div
makeData = (key, value) ->
    item = {}
    item[key] = value
    return JSON.stringify item

getInjectionURL = (fileName) ->
    chrome.extension.getURL "javascripts/#{fileName}.js" +
    "?nocache=#{new Date().getTime()}"

injectAllScripts = do ->
    injected = false
    return (scriptnames) ->
        unless injected
            for fileName in scriptnames
                injectScript getInjectionURL fileName
            injected = true

window.Injector = {
    injectScript
    injectData
    injectAllScripts
    getInjectionURL
}
