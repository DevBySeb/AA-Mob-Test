package aa.mob.test.featureSearch.event.handler

import aa.mob.test.domain.useCase.GetSuggestedBreweriesUseCase
import aa.mob.test.featureSearch.event.SearchScreenEvent
import aa.mob.test.featureSearch.state.provider.SearchScreenStateProvider
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.launch
import javax.inject.Inject

class DefaultSearchEventHandler @Inject constructor(
    private val searchScreenStateProvider: SearchScreenStateProvider,
    private val getSuggestedBreweriesUseCase: GetSuggestedBreweriesUseCase,
    private val viewModelScope: CoroutineScope
) : SearchEventHandler {

    override fun dispatchEvent(event: SearchScreenEvent) = when (event) {
        is SearchScreenEvent.ShowMoreClicked -> {
            searchScreenStateProvider.updateUiState(
                searchScreenStateProvider.uiModel.value.copy(
                    isListExpanded = true
                )
            )
        }

        is SearchScreenEvent.BreweryClicked -> {

        }

        is SearchScreenEvent.SearchBrewery -> {
            viewModelScope.launch {
                val breweries =
                    getSuggestedBreweriesUseCase.invoke(event.searchText).getOrDefault(emptyList())
                searchScreenStateProvider.updateUiState(
                    searchScreenStateProvider.uiModel.value.copy(
                        breweries = breweries
                    )
                )
            }
            Unit
        }
    }
}