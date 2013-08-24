
checkAllModules = (modules) ->
    booleanArray = modules.map (module) ->
        window.hasOwnProperty module
    return booleanArray.reduce (soFar, current) ->
        soFar and current
    ,true

window.Loader = {
    waitFor: (modules, callback) ->
        unless modules instanceof Array
            modules = [modules]
        loadAfter = (time, modules, callback) ->

            if checkAllModules modules
                callback.apply window, modules.map (module) ->
                    window[module]
            else
                console.log 'waiting for'
                console.log  modules
                setTimeout ->
                    loadAfter time * 2, modules, callback
                ,time

        loadAfter 100, modules, callback
}
