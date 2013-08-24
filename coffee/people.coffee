
#TODO re-brand as "data"
#would also be cool to use "tiny promise" "library"
#that you'll write yourself

#actually maybe just wrap chrome storage in "tiny promise",
#if such a thing exists

genericGetter = (itemKey) ->
    (callback) ->
        query = {}
        query[itemKey] = null
        chrome.storage.local.get query, (result) ->
            item = result[itemKey]
            callback item
genericSetter = (itemKey) ->
    (itemValue, callback) ->
        item = {}
        item[itemKey] = itemValue
        chrome.storage.local.set item, ->
            callback()

getMe = genericGetter 'me'
getPartner = genericGetter 'partner'
setMe = genericSetter 'me'
setPartner = genericSetter 'partner'

window.People = {
    getMe
    getPartner
    setMe
    setPartner
}
