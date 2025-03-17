package aa.mob.test.featureSearch.viewmodel.search

import aa.mob.test.featureSearch.event.search.SearchScreenEvent
import aa.mob.test.featureSearch.event.search.handler.SearchEventHandler
import aa.mob.test.featureSearch.model.search.SearchScreenUiModel
import aa.mob.test.featureSearch.state.search.provider.SearchScreenStateProvider
import androidx.lifecycle.ViewModel
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.StateFlow
import javax.inject.Inject

@HiltViewModel
class SearchScreenViewModel @Inject constructor(
    searchScreenStateProvider: SearchScreenStateProvider,
    private val searchEventHandler: SearchEventHandler
): ViewModel() {

    val screenState: StateFlow<SearchScreenUiModel> = searchScreenStateProvider.screenState

    fun dispatchEvent(event: SearchScreenEvent) = searchEventHandler.dispatchEvent(event)
}