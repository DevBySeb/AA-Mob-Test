package aa.mob.test.featureSearch.event.search.handler

import aa.mob.test.domain.di.AppScope
import aa.mob.test.domain.useCase.GetSuggestedBreweriesUseCase
import aa.mob.test.domain.useCase.InsertBreweryHistoryModelUseCase
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
    private val insertBreweryHistoryModelUseCase: InsertBreweryHistoryModelUseCase,
    @Search private val viewModelScope: CoroutineScope,
    @AppScope private val appScope: CoroutineScope,
) : SearchEventHandler {

    override fun dispatchEvent(event: SearchScreenEvent) = when (event) {
        is SearchScreenEvent.ShowMoreClicked -> {
            with(searchScreenStateProvider.screenState.value.uiModel) {
                viewModelScope.launch {
                    val additionalBreweries =
                        getSuggestedBreweriesUseCase.invoke(searchQuery, 2)

                    searchScreenStateProvider.updateUiState(
                        searchScreenStateProvider.screenState.value.uiModel.copy(
                            breweries = breweries + additionalBreweries,
                            isListExpanded = true
                        )
                    )

                }
                Unit
            }
        }

        is SearchScreenEvent.BreweryClicked -> {
            appScope.launch {
                insertBreweryHistoryModelUseCase.invoke(
                    id = event.breweryId,
                    name = event.breweryName
                )
            }
            Unit
        }

        is SearchScreenEvent.SearchBrewery -> {
            viewModelScope.launch {
                val breweries =
                    getSuggestedBreweriesUseCase.invoke(event.searchText, 1)
                searchScreenStateProvider.updateUiState(
                    searchScreenStateProvider.screenState.value.uiModel.copy(
                        breweries = breweries,
                        searchQuery = event.searchText
                    )
                )
            }
            Unit
        }
    }
}