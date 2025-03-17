package aa.mob.test.featureSearch.state.details

import aa.mob.test.featureSearch.di.details.Details
import aa.mob.test.featureSearch.model.details.DetailsUiModel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.flow.update
import javax.inject.Inject

class DefaultDetailsScreenStateProvider @Inject constructor(
    @Details viewModelScope: CoroutineScope,
    uiModelFactory: DetailsUiModel.Factory,
) : DetailsScreenStateProvider {

    override fun updateUiState(uiState: DetailsUiModel) = _screenState.update { uiState }

    private val _screenState = MutableStateFlow(uiModelFactory.createEmpty())
    override val screenState: StateFlow<DetailsUiModel> =
        _screenState.stateIn(viewModelScope, SharingStarted.Eagerly, uiModelFactory.createEmpty())
}
