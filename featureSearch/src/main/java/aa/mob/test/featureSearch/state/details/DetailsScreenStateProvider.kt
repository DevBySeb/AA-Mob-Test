package aa.mob.test.featureSearch.state.details

import aa.mob.test.featureSearch.model.details.DetailsUiModel
import kotlinx.coroutines.flow.StateFlow

interface DetailsScreenStateProvider {

    fun updateUiState(uiState: DetailsUiModel)

    val screenState: StateFlow<DetailsUiModel>
}