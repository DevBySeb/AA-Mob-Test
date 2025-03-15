package aa.mob.test.featureSearch.ui

import aa.mob.test.featureSearch.R
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.BasicTextField
import androidx.compose.foundation.text.input.TextFieldState
import androidx.compose.material3.Button
import androidx.compose.material3.Icon
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@Composable
fun SearchScreen() {
    Column {
        Icon(painter = painterResource(R.drawable.ic_search), contentDescription = null)
        Text("Search for a brewery")
        Search()
        SearchSuggestions(
            listOf(),
            {},
            {},
            isListExpanded = false
        )
    }
}


@Composable
fun Search() {
    BasicTextField(
        state = TextFieldState("lol"),

        )
}

@Composable
fun SearchSuggestions(
    suggestionList: List<String>,
    onSuggestionClick: () -> Unit,
    onShowMoreClick: () -> Unit,
    isListExpanded: Boolean
) {
    Column(modifier = Modifier.background(color = Color.Gray, shape = RoundedCornerShape(6.dp))) {
        suggestionList.take(if (isListExpanded) 10 else 5).forEach { suggestion ->
            Text(suggestion)
        }
    }
    if(!isListExpanded) TextButton(onClick = onShowMoreClick) {
        Text("Show more")
    }
}

@Preview
@Composable
fun SearchScreen_Preview() {
    SearchScreen()
}