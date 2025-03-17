package aa.mob.test.featureSearch.event.search

sealed class SearchScreenEvent {

    data object ShowMoreClicked: SearchScreenEvent()
    data class SearchBrewery(val searchText: String): SearchScreenEvent()
    data class BreweryClicked(val breweryId: String): SearchScreenEvent()
}