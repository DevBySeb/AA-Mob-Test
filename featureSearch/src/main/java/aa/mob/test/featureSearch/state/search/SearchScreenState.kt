package aa.mob.test.featureSearch.state.search

import aa.mob.test.domain.model.BreweryModel
import aa.mob.test.featureSearch.model.search.SearchScreenUiModel

data class SearchScreenState(
    val suggestedBreweries: List<BreweryModel>,
    val uiModel: SearchScreenUiModel
) {
    interface Factory {
        fun createEmpty(emptyUiModel: SearchScreenUiModel): SearchScreenState
    }
}
