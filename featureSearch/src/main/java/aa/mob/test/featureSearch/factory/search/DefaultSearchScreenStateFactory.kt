package aa.mob.test.featureSearch.factory.search

import aa.mob.test.featureSearch.model.search.SearchScreenUiModel
import aa.mob.test.featureSearch.state.search.SearchScreenState
import javax.inject.Inject

class DefaultSearchScreenStateFactory @Inject constructor(): SearchScreenState.Factory {
    override fun createEmpty(emptyUiModel: SearchScreenUiModel): SearchScreenState =
        SearchScreenState(emptyList(),emptyUiModel)

}