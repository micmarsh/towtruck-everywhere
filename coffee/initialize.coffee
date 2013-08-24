
SAMPLE_HOST = 'www.websocket.org'

#this will pull from chrome storage, maybe, if you can get that
#kind of thing in a context script
getUrls = -> [SAMPLE_HOST]

Loader.waitFor 'Injector', (Injector) ->
    alert window.location.host
    if window.location.host in getUrls()
        console.log Injector
        Injector.injectScript "https://towtruck.mozillalabs.com/towtruck.js"

Loader.waitFor 'TowTruck', (TowTruck) ->
    console.log TowTruck
    TowTruck window

