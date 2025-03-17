package aa.mob.test.featureSearch.viewmodel

import aa.mob.test.featureSearch.event.handler.SearchEventHandler
import aa.mob.test.featureSearch.state.SearchScreenState
import aa.mob.test.featureSearch.state.provider.SearchScreenStateProvider
import androidx.lifecycle.ViewModel
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.StateFlow
import javax.inject.Inject

@HiltViewModel
class SearchScreenViewModel @Inject constructor(
    private val searchScreenStateProvider: SearchScreenStateProvider,
    private val searchEventHandler: SearchEventHandler
): ViewModel() {

    val screenState: StateFlow<SearchScreenState> = searchScreenStateProvider.screenState
}