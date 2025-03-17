package aa.mob.test.featureSearch.state.search.provider

import aa.mob.test.featureSearch.di.search.Search
import aa.mob.test.featureSearch.model.search.SearchScreenUiModel
import dagger.hilt.android.scopes.ViewModelScoped
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.flow.update
import javax.inject.Inject

@ViewModelScoped
class DefaultSearchScreenStateProvider @Inject constructor(
    @Search viewModelScope: CoroutineScope,
    uiModelFactory: SearchScreenUiModel.Factory,
) : SearchScreenStateProvider {

    override fun updateUiState(uiState: SearchScreenUiModel) = _screenState.update { uiState }
    private val _screenState = MutableStateFlow(uiModelFactory.createEmpty())
    override val screenState: StateFlow<SearchScreenUiModel> =
        _screenState.stateIn(viewModelScope, SharingStarted.Eagerly, uiModelFactory.createEmpty())

}