package aa.mob.test.featureSearch.event.details.handler

import aa.mob.test.featureSearch.event.details.DetailsEvent

interface DetailsEventHandler {

    fun dispatchEvent(event: DetailsEvent)
}