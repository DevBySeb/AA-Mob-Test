package aa.mob.test.featureSearch.event.details

sealed class DetailsEvent {
    data class Init(val breweryId: String): DetailsEvent()
}