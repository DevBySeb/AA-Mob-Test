package aa.mob.test.featureSearch.model

import androidx.compose.foundation.text.input.TextFieldState

data class SearchScreenUiModel(
    val searchText: TextFieldState,
    val isListExpanded: Boolean,
)
