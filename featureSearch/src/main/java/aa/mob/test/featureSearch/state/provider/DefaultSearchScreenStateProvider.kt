package aa.mob.test.featureSearch.state.provider

import aa.mob.test.domain.useCase.GetSuggestedBreweriesUseCase
import aa.mob.test.featureSearch.model.SearchScreenUiModel
import aa.mob.test.featureSearch.state.SearchScreenState
import androidx.compose.foundation.text.input.TextFieldState
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.flow.update
import javax.inject.Inject

class DefaultSearchScreenStateProvider @Inject constructor(
    private val getSuggestedBreweries: GetSuggestedBreweriesUseCase,
    viewModelScope: CoroutineScope,
    uiModelFactory: SearchScreenUiModel.Factory,
    screenStateFactory: SearchScreenState.Factory,
): SearchScreenStateProvider {
    private val _uiModel = MutableStateFlow(uiModelFactory.createEmpty())
    override val uiModel: StateFlow<SearchScreenUiModel> = _uiModel

    override fun updateUiState(uiState: SearchScreenUiModel) = _uiModel.update { uiState }

    override val screenState: StateFlow<SearchScreenState> = uiModel
        .map {
            val breweries = getSuggestedBreweries.invoke(uiModel.value.searchText.text.toString())
            SearchScreenState(breweries.getOrDefault(emptyList()), uiModel.value)
        }.stateIn(viewModelScope, SharingStarted.Lazily, screenStateFactory.createEmpty(uiModel.value))

}