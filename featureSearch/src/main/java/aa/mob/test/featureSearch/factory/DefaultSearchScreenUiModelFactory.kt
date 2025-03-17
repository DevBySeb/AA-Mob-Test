package aa.mob.test.featureSearch.factory

import aa.mob.test.featureSearch.model.SearchScreenUiModel
import androidx.compose.foundation.text.input.TextFieldState
import javax.inject.Inject

class DefaultSearchScreenUiModelFactory @Inject constructor(): SearchScreenUiModel.Factory {
    override fun createEmpty(): SearchScreenUiModel =
        SearchScreenUiModel(TextFieldState(""), false, emptyList())
}