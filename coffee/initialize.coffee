
SAMPLE_HOST = 'www.websocket.org'

#this will pull from chrome storage, maybe, if you can get that
#kind of thing in a context script
getUrls = -> [SAMPLE_HOST, "www.w3.org"]

Loader.waitFor 'Injector', ({injectScript, getInjectionUrl}) ->
    if window.location.host in getUrls()
        injectScript "https://towtruck.mozillalabs.com/towtruck.js"
        injectScript getInjectionUrl 'page'


