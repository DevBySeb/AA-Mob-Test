package aa.mob.test.featureSearch.event.details.handler

import aa.mob.test.domain.useCase.GetBreweryUseCase
import aa.mob.test.featureSearch.di.details.Details
import aa.mob.test.featureSearch.event.details.DetailsEvent
import aa.mob.test.featureSearch.state.details.DetailsScreenStateProvider
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.launch
import javax.inject.Inject

class DefaultDetailsEventHandler @Inject constructor(
    @Details private val viewModelScope: CoroutineScope,
    private val stateProvider: DetailsScreenStateProvider,
    private val getBreweryUseCase: GetBreweryUseCase
) : DetailsEventHandler {
    override fun dispatchEvent(event: DetailsEvent) = when (event) {
        is DetailsEvent.Init -> {
            viewModelScope.launch {
                val brewery = getBreweryUseCase.invoke(event.breweryId)
                stateProvider.updateUiState(stateProvider.screenState.value.copy(breweryModel = brewery))
            }
            Unit
        }
    }


}