package aa.mob.test.featureSearch.factory

import aa.mob.test.featureSearch.model.SearchScreenUiModel
import aa.mob.test.featureSearch.state.SearchScreenState
import javax.inject.Inject

class DefaultSearchScreenStateFactory @Inject constructor(): SearchScreenState.Factory {
    override fun createEmpty(emptyUiModel: SearchScreenUiModel): SearchScreenState =
        SearchScreenState(emptyList(),emptyUiModel)

}