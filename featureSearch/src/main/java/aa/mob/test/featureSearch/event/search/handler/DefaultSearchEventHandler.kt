package aa.mob.test.featureSearch.event.search.handler

import aa.mob.test.domain.useCase.GetSuggestedBreweriesUseCase
import aa.mob.test.featureSearch.di.search.Search
import aa.mob.test.featureSearch.event.search.SearchScreenEvent
import aa.mob.test.featureSearch.state.search.provider.SearchScreenStateProvider
import dagger.hilt.android.scopes.ViewModelScoped
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.launch
import javax.inject.Inject

@ViewModelScoped
class DefaultSearchEventHandler @Inject constructor(
    private val searchScreenStateProvider: SearchScreenStateProvider,
    private val getSuggestedBreweriesUseCase: GetSuggestedBreweriesUseCase,
    @Search private val viewModelScope: CoroutineScope
) : SearchEventHandler {

    override fun dispatchEvent(event: SearchScreenEvent) = when (event) {
        is SearchScreenEvent.ShowMoreClicked -> {
            with(searchScreenStateProvider.screenState.value) {
                viewModelScope.launch {
                    val additionalBreweries =
                        getSuggestedBreweriesUseCase.invoke(searchQuery, 2)

                    searchScreenStateProvider.updateUiState(
                        copy(
                            breweries = breweries + additionalBreweries,
                            isListExpanded = true
                        )
                    )
                }
                Unit
            }
        }

        is SearchScreenEvent.BreweryClicked -> {
        }

        is SearchScreenEvent.SearchBrewery -> {
            viewModelScope.launch {
                val breweries =
                    getSuggestedBreweriesUseCase.invoke(event.searchText, 1)
                searchScreenStateProvider.updateUiState(
                    searchScreenStateProvider.screenState.value.copy(
                        breweries = breweries,
                        searchQuery = event.searchText
                    )
                )
            }
            Unit
        }
    }
}