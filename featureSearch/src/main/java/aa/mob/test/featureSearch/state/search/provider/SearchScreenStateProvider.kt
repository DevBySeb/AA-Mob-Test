package aa.mob.test.featureSearch.state.search.provider

import aa.mob.test.featureSearch.model.search.SearchScreenUiModel
import kotlinx.coroutines.flow.StateFlow

interface SearchScreenStateProvider {

    fun updateUiState(uiState: SearchScreenUiModel)

    val screenState: StateFlow<SearchScreenUiModel>
}