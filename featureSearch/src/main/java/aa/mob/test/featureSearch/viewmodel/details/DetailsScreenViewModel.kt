package aa.mob.test.featureSearch.viewmodel.details

import aa.mob.test.featureSearch.event.details.DetailsEvent
import aa.mob.test.featureSearch.event.details.handler.DetailsEventHandler
import aa.mob.test.featureSearch.state.details.DetailsScreenStateProvider
import androidx.lifecycle.ViewModel
import dagger.hilt.android.lifecycle.HiltViewModel
import javax.inject.Inject

@HiltViewModel
class DetailsScreenViewModel @Inject constructor(
    detailsScreenStateProvider: DetailsScreenStateProvider,
    private val detailsEventHandler: DetailsEventHandler
): ViewModel() {

    val screenState = detailsScreenStateProvider.screenState

    fun dispatchEvent(detailsEvent: DetailsEvent) = detailsEventHandler.dispatchEvent(detailsEvent)
}
