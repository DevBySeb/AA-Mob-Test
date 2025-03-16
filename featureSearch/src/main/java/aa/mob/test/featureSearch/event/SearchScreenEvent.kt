package aa.mob.test.featureSearch.event

sealed class SearchScreenEvent {

    data object ShowMoreClicked: SearchScreenEvent()
    data class SearchValueChanged(val textChanged: String)
    data class BreweryClicked(val breweryId: Int)
}