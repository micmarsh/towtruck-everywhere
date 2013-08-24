
checkAllModules = (modules) ->
    booleanArray = modules.map (module) ->
        window.hasOwnProperty module
    return booleanArray.reduce (soFar, current) ->
        soFar and current
    ,true

castToArray = (items) ->
    if items instanceof Array
        items
    else
        [ items ]

getModuleObjects = (moduleStrings) ->
    moduleStrings.map (module) ->
        window[module]

window.Loader = {
    waitFor: (modules, callback) ->
        loadAfter = (time, modules, callback) ->
            if checkAllModules modules
                callback.apply window, getModuleObjects modules
            else
                setTimeout ->
                    loadAfter time * 2, modules, callback
                ,time

        loadAfter 100, castToArray(modules), callback
}
