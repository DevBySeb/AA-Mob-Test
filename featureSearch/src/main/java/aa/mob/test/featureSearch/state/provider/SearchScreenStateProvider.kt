package aa.mob.test.featureSearch.state.provider

import aa.mob.test.featureSearch.model.SearchScreenUiModel
import aa.mob.test.featureSearch.state.SearchScreenState
import kotlinx.coroutines.flow.StateFlow

interface SearchScreenStateProvider {

    fun updateUiState(uiState: SearchScreenUiModel)

    val screenState: StateFlow<SearchScreenState>
    val uiModel: StateFlow<SearchScreenUiModel>
}