package aa.mob.test.featureSearch.event.handler

import aa.mob.test.featureSearch.event.SearchScreenEvent

interface SearchEventHandler {

    fun dispatchEvent(event: SearchScreenEvent)
}