package aa.mob.test.featureSearch.factory.search

import aa.mob.test.featureSearch.model.search.SearchScreenUiModel
import androidx.compose.foundation.text.input.TextFieldState
import dagger.hilt.android.scopes.ViewModelScoped
import javax.inject.Inject

@ViewModelScoped
class DefaultSearchScreenUiModelFactory @Inject constructor() : SearchScreenUiModel.Factory {
    override fun createEmpty(): SearchScreenUiModel =
        SearchScreenUiModel(
            searchText = TextFieldState(""),
            isListExpanded = false,
            searchQuery = "",
            breweries = emptyList()
        )
}