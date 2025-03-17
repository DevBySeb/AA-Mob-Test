package aa.mob.test.featureSearch.event

sealed class SearchScreenEvent {

    data object ShowMoreClicked: SearchScreenEvent()
    data class SearchBrewery(val searchText: String): SearchScreenEvent()
    data class BreweryClicked(val breweryId: Int): SearchScreenEvent()
}