package aa.mob.test.featureSearch.event.search.handler

import aa.mob.test.featureSearch.event.search.SearchScreenEvent

interface SearchEventHandler {

    fun dispatchEvent(event: SearchScreenEvent)
}