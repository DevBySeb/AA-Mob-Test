package aa.mob.test.featureSearch.model.search

import aa.mob.test.domain.model.BreweryModel
import androidx.compose.foundation.text.input.TextFieldState

data class SearchScreenUiModel(
    val searchText: TextFieldState,
    val isListExpanded: Boolean,
    val searchQuery: String,
    val breweries: List<BreweryModel>
) {
    interface Factory {
        fun createEmpty(): SearchScreenUiModel
    }
}
