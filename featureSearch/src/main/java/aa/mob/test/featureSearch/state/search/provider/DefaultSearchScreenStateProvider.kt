package aa.mob.test.featureSearch.state.search.provider

import aa.mob.test.domain.useCase.GetBreweryHistoryUseCase
import aa.mob.test.featureSearch.di.search.Search
import aa.mob.test.featureSearch.model.search.SearchScreenUiModel
import aa.mob.test.featureSearch.state.search.SearchScreenState
import dagger.hilt.android.scopes.ViewModelScoped
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.flow.update
import javax.inject.Inject

@ViewModelScoped
class DefaultSearchScreenStateProvider @Inject constructor(
    @Search viewModelScope: CoroutineScope,
    uiModelFactory: SearchScreenUiModel.Factory,
    screenStateFactory: SearchScreenState.Factory,
    getBreweryHistoryUseCase: GetBreweryHistoryUseCase,
) : SearchScreenStateProvider {

    override fun updateUiState(uiState: SearchScreenUiModel) = _uiState.update { uiState }

    private val _uiState = MutableStateFlow(uiModelFactory.createEmpty())
    override val uiState: StateFlow<SearchScreenUiModel> = _uiState

    override val screenState: StateFlow<SearchScreenState> =
        _uiState.combine(getBreweryHistoryUseCase.invoke()) { uiState, breweryHistory ->
            screenStateFactory.create(uiState, breweryHistory)
        }.stateIn(
            viewModelScope,
            SharingStarted.Eagerly,
            screenStateFactory.createEmpty(uiState.value)
        )

}