package aa.mob.test.featureSearch.state.search

import aa.mob.test.domain.model.BreweryHistoryModel
import aa.mob.test.featureSearch.model.search.SearchScreenUiModel

data class SearchScreenState(
    val breweriesHistory: List<BreweryHistoryModel>,
    val uiModel: SearchScreenUiModel
) {
    interface Factory {
        fun createEmpty(emptyUiModel: SearchScreenUiModel): SearchScreenState

        fun create(
            uiModel: SearchScreenUiModel,
            breweryHistoryList: List<BreweryHistoryModel>
        ): SearchScreenState
    }
}
