package aa.mob.test.featureSearch.state.search.provider

import aa.mob.test.featureSearch.model.search.SearchScreenUiModel
import aa.mob.test.featureSearch.state.search.SearchScreenState
import kotlinx.coroutines.flow.StateFlow

interface SearchScreenStateProvider {

    fun updateUiState(uiState: SearchScreenUiModel)

    val uiState: StateFlow<SearchScreenUiModel>

    val screenState: StateFlow<SearchScreenState>
}