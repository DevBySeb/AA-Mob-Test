package aa.mob.test.featureSearch.ui.search

import aa.mob.test.domain.model.BreweryModel
import aa.mob.test.featureSearch.event.search.SearchScreenEvent
import aa.mob.test.featureSearch.model.search.SearchScreenUiModel
import aa.mob.test.featureSearch.viewmodel.SearchScreenViewModel
import aa.mob.test.resources.theme.Color
import aa.mob.test.resources.theme.Type
import aa.mob.test.resources.theme.defaultGrid
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.BasicTextField
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.foundation.text.input.TextFieldState
import androidx.compose.material3.Icon
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.SolidColor
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import aa.mob.test.resources.R as ResR

@Composable
fun SearchScreen(viewModel: SearchScreenViewModel = hiltViewModel(), goToBrewery: (String) -> Unit) {
    val uiState = viewModel.screenState.collectAsState().value
    SearchComposable(uiState = uiState, onEvent = {
        viewModel.dispatchEvent(it)
    }, goToBrewery = goToBrewery)


}

@Composable
fun SearchComposable(uiState: SearchScreenUiModel, onEvent: (SearchScreenEvent) -> Unit, goToBrewery: (String) -> Unit) {

    Column(
        modifier = Modifier
            .fillMaxSize()
            .background(Color.background)
            .padding(horizontal = defaultGrid.grid_4),
        horizontalAlignment = Alignment.CenterHorizontally,
    ) {
        Icon(
            painter = painterResource(ResR.drawable.ic_search),
            tint = androidx.compose.ui.graphics.Color.Unspecified,
            contentDescription = null,
            modifier = Modifier.padding(top = defaultGrid.grid_10)
        )
        // So I do know it's called a slider but virtually this has no logic,
        // so I decided to not bother with slider and its logic
        Icon(
            painter = painterResource(ResR.drawable.ic_slider),
            tint = androidx.compose.ui.graphics.Color.Unspecified,
            contentDescription = null,
            modifier = Modifier.padding(top = defaultGrid.grid_3)
        )
        Text(
            stringResource(ResR.string.search_for_brewery),
            color = Color.textWhiteSecondary,
            style = Type.titleLarge,
            modifier = Modifier.padding(top = defaultGrid.grid_7)
        )
        Search(
            modifier = Modifier.padding(top = defaultGrid.grid_10),
            textFieldState = uiState.searchText,
            onEvent = onEvent
        )
        SearchSuggestions(
            modifier = Modifier.padding(top = defaultGrid.grid_3),
            suggestionList = uiState.breweries,
            onEvent = onEvent,
            isListExpanded = uiState.isListExpanded,
            goToBrewery = goToBrewery,
        )
    }
}


@Composable
fun Search(
    modifier: Modifier,
    textFieldState: TextFieldState,
    onEvent: (SearchScreenEvent) -> Unit,
) {
    Box(
        modifier = modifier
            .fillMaxWidth()
            .border(1.dp, Color.tipColor, RoundedCornerShape(6.dp))
    ) {
        if (textFieldState.text.isBlank()) {
            Text(
                text = stringResource(ResR.string.tip_text),
                style = Type.bodyLarge.copy(color = Color.tipColor),
                modifier = Modifier
                    .align(Alignment.CenterStart)
                    .padding(defaultGrid.grid_3)
            )
        }
        BasicTextField(
            modifier = Modifier
                .fillMaxWidth()
                .padding(defaultGrid.grid_3),
            state = textFieldState,
            keyboardOptions = KeyboardOptions(
                imeAction = ImeAction.Done,
            ),
            textStyle = Type.bodyLarge.copy(color = Color.textWhite),
            onKeyboardAction = { onEvent(SearchScreenEvent.SearchBrewery(textFieldState.text.toString())) },
            cursorBrush = SolidColor(Color.textWhite)
        )
    }
}

@Composable
fun SearchSuggestions(
    modifier: Modifier,
    suggestionList: List<BreweryModel>,
    onEvent: (SearchScreenEvent) -> Unit,
    isListExpanded: Boolean,
    goToBrewery: (String) -> Unit,
) {
    if (suggestionList.isNotEmpty()) {
        Column(
            modifier = modifier
                .background(
                    color = Color.autocompleteBackground,
                    shape = RoundedCornerShape(6.dp)
                )
                .padding(defaultGrid.grid_3),
        ) {
            suggestionList.take(if (isListExpanded) 10 else 5).forEach { suggestion ->
                Text(
                    suggestion.name,
                    color = Color.textWhite,
                    style = Type.bodyLarge,
                    modifier = Modifier
                        .padding(vertical = defaultGrid.grid_3)
                        .fillMaxWidth()
                        .clickable(onClick = {
                            onEvent.invoke(
                                SearchScreenEvent.BreweryClicked(
                                    suggestion.id
                                )
                            )
                            goToBrewery.invoke(suggestion.id)
                        })
                )
            }
            if (!isListExpanded) TextButton(
                onClick = { onEvent(SearchScreenEvent.ShowMoreClicked) },
                shape = RoundedCornerShape(24.dp),
                modifier = Modifier
                    .padding(top = defaultGrid.grid_2)
                    .fillMaxWidth()
                    .border(1.dp, Color.tipColor, shape = RoundedCornerShape(24.dp))
            ) {
                Text(
                    stringResource(ResR.string.show_more_button),
                    style = Type.bodyLarge,
                    color = Color.tipColor
                )
            }
        }
    }
}

@Preview
@Composable
fun SearchComposableExpanded_Preview() {
    val mockScreenState = SearchScreenUiModel(
        searchText = TextFieldState("search"),
        isListExpanded = false,
        breweries = listOf(
            BreweryModel(id = "0", name = "Second Chance Beer Company"),
            BreweryModel(id = "1", name = "Ballast Point Brewing Company")
        ),
        searchQuery = ""
    )
    SearchComposable(mockScreenState, goToBrewery = {}, onEvent = {})
}

@Preview
@Composable
fun SearchComposableCollapsed_Preview() {
    val mockScreenState = SearchScreenUiModel(
        searchText = TextFieldState("search"),
        isListExpanded = false,
        breweries = listOf(
            BreweryModel(id = "0", name = "Second Chance Beer Company"),
            BreweryModel(id = "1", name = "Ballast Point Brewing Company")
        ),
        searchQuery = ""
    )
    SearchComposable(mockScreenState, goToBrewery = {}, onEvent = {})
}

@Preview
@Composable
fun SearchComposableEmptySearch_Preview() {
    val mockScreenState = SearchScreenUiModel(
        searchText = TextFieldState("search"),
        isListExpanded = false,
        breweries = listOf(),
        searchQuery = ""
    )
    SearchComposable(mockScreenState, goToBrewery = {}, onEvent = {})
}