package aa.mob.test.featureSearch.ui

import aa.mob.test.domain.model.BreweryModel
import aa.mob.test.featureSearch.viewmodel.SearchScreenViewModel
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.BasicTextField
import androidx.compose.foundation.text.input.TextFieldState
import androidx.compose.material3.Icon
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import aa.mob.test.resources.R as ResR
import aa.mob.test.resources.theme.Color
import aa.mob.test.resources.theme.Type
import androidx.compose.runtime.collectAsState
import androidx.hilt.navigation.compose.hiltViewModel

@Composable
fun SearchScreen(viewModel: SearchScreenViewModel = hiltViewModel()) {
    val screenState = viewModel.screenState.collectAsState().value
    Column(modifier = Modifier.fillMaxSize().background(Color.background), horizontalAlignment = Alignment.CenterHorizontally,) {
        Icon(painter = painterResource(ResR.drawable.ic_search), contentDescription = null)
        Text(
            stringResource(ResR.string.search_for_brewery),
            color = Color.textWhiteSecondary,
            style = Type.titleLarge
        )
        Search(screenState.uiModel.searchText)
        SearchSuggestions(
            screenState.suggestedBreweries,
            {},
            {},
            isListExpanded = screenState.uiModel.isListExpanded
        )
    }
}


@Composable
fun Search(textFieldState: TextFieldState) {
    BasicTextField(
        state = textFieldState,
    )
}

@Composable
fun SearchSuggestions(
    suggestionList: List<BreweryModel>,
    onBreweryClick: (String) -> Unit,
    onShowMoreClick: () -> Unit,
    isListExpanded: Boolean
) {
    Column(
        modifier = Modifier.background(
            color = Color.autocompleteBackground,
            shape = RoundedCornerShape(6.dp)
        )
    ) {
        suggestionList.take(if (isListExpanded) 10 else 5).forEach { suggestion ->
            Text(suggestion.name)
        }
    }
    if (!isListExpanded) TextButton(onClick = onShowMoreClick) {
        Text("Show more")
    }
}

@Preview
@Composable
fun SearchScreen_Preview() {
    SearchScreen()
}