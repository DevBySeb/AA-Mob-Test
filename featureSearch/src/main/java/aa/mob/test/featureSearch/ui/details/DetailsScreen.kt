package aa.mob.test.featureSearch.ui.details

import aa.mob.test.resources.theme.Color
import aa.mob.test.resources.theme.Type
import aa.mob.test.resources.theme.defaultGrid
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Icon
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import aa.mob.test.resources.R as ResR

@Composable
fun DetailsScreen() {
    DetailsComposable()
}

@Composable
fun DetailsComposable() {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .background(Color.background)
            .padding(horizontal = defaultGrid.grid_4),
        horizontalAlignment = Alignment.CenterHorizontally,
    ) {
        Icon(painter = painterResource(ResR.drawable.ic_slider), contentDescription = null)
        Text(
            "Brewery street 1234",
            color = Color.textWhiteSecondary,
            style = Type.titleLarge,
            modifier = Modifier.padding(top = defaultGrid.grid_7_5)
        )
        BreweryDetails(modifier = Modifier.padding(top = defaultGrid.grid_10), "")
        BeveragesList(modifier = Modifier.padding(top = defaultGrid.grid_10))
    }
}

@Composable
fun BreweryDetails(modifier: Modifier, breweryAddress: String) {
    Column(modifier = modifier.fillMaxWidth()) {
        Text(
            stringResource(ResR.string.details_address),
            color = Color.textWhite,
            style = Type.bodyLarge
        )
        Text(
            breweryAddress,
            color = Color.textWhite,
            style = Type.bodyLarge.copy(fontWeight = FontWeight.Normal),
            modifier = Modifier.padding(top = defaultGrid.grid_2_5)
        )
    }
}

@Composable
fun BeveragesList(modifier: Modifier) {
    Column(modifier = modifier.fillMaxWidth()) {
        Text(
            stringResource(ResR.string.details_beverages),
            color = Color.textWhite,
            style = Type.bodyLarge
        )
        Text("")
    }
}

@Preview
@Composable
fun DetailsComposable_Preview() {
    DetailsComposable()
}

