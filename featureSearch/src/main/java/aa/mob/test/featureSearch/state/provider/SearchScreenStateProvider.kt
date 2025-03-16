package aa.mob.test.featureSearch.state.provider

import aa.mob.test.domain.useCase.GetSuggestedBreweriesUseCase
import aa.mob.test.featureSearch.model.SearchScreenUiModel
import aa.mob.test.featureSearch.state.SearchScreenState
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.flow.update
import javax.inject.Inject

class SearchScreenStateProvider @Inject constructor(
    private val getSuggestedBreweries: GetSuggestedBreweriesUseCase,
    private val scope: CoroutineScope
) {
    private val _uiModel = MutableStateFlow(SearchScreenUiModel())
    private val uiModel: StateFlow<SearchScreenUiModel> = _uiModel

    fun updateUiState(uiState: SearchScreenUiModel) = _uiModel.update { uiState }

    val screenState: StateFlow<SearchScreenState> = uiModel
        .map {
            val breweries = getSuggestedBreweries.invoke(uiModel.value.searchText.text.toString())
            SearchScreenState(breweries.getOrDefault(emptyList()), uiModel.value)
        }.stateIn(scope, SharingStarted.Lazily, SearchScreenState(emptyList(), uiModel.value))

}