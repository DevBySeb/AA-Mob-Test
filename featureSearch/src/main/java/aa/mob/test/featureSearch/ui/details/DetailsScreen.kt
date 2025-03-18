package aa.mob.test.featureSearch.ui.details

import aa.mob.test.domain.model.BeverageModel
import aa.mob.test.domain.model.BreweryModel
import aa.mob.test.featureSearch.event.details.DetailsEvent
import aa.mob.test.featureSearch.model.details.DetailsUiModel
import aa.mob.test.featureSearch.viewmodel.details.DetailsScreenViewModel
import aa.mob.test.resources.theme.Color
import aa.mob.test.resources.theme.Type
import aa.mob.test.resources.theme.defaultGrid
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.requiredHeight
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.HorizontalDivider
import androidx.compose.material3.Icon
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.collectAsState
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.capitalize
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.intl.Locale
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import aa.mob.test.resources.R as ResR

@Composable
fun DetailsScreen(
    viewModel: DetailsScreenViewModel = hiltViewModel(),
    breweryId: String,
    onGoBack: () -> Unit
) {
    val uiState = viewModel.screenState.collectAsState().value
    LaunchedEffect(breweryId) {
        viewModel.dispatchEvent(DetailsEvent.Init(breweryId))
    }

    DetailsComposable(uiState = uiState, onGoBack = onGoBack)
}

@Composable
fun DetailsComposable(uiState: DetailsUiModel, onGoBack: () -> Unit) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(horizontal = defaultGrid.grid_4),
        horizontalAlignment = Alignment.CenterHorizontally,
    ) {
        TextButton(
            onClick = onGoBack,
            modifier = Modifier.align(Alignment.Start),
            contentPadding = PaddingValues(0.dp)
        ) {
            Icon(
                painter = painterResource(ResR.drawable.ic_chevron_left),
                contentDescription = null,
                tint = androidx.compose.ui.graphics.Color.Unspecified,
                modifier = Modifier.padding(end = defaultGrid.grid_2)
            )
            Text(
                stringResource(ResR.string.action_back).capitalize(Locale.current),
                color = Color.textWhite,
                style = Type.bodyLarge.copy(fontWeight = FontWeight.Normal)
            )
        }

        Icon(
            painter = painterResource(ResR.drawable.ic_slider),
            tint = androidx.compose.ui.graphics.Color.Unspecified,
            contentDescription = null,
            modifier = Modifier.padding(top = defaultGrid.grid_10)
        )
        uiState.breweryModel?.let { breweryModel ->
            Text(
                breweryModel.name,
                color = Color.textWhiteSecondary,
                style = Type.titleLarge,
                modifier = Modifier.padding(top = defaultGrid.grid_7_5)
            )

            BreweryDetails(
                modifier = Modifier.padding(top = defaultGrid.grid_15),
                breweryModel.name
            )
        }
        BeveragesList(modifier = Modifier.padding(top = defaultGrid.grid_15), uiState.beverages)

        TextButton(
            modifier = Modifier
                .fillMaxWidth()
                .padding(top = defaultGrid.grid_4),
            onClick = onGoBack,
            shape = RoundedCornerShape(24.dp),
            colors = ButtonDefaults.buttonColors(containerColor = Color.buttonColorPrimary)
        ) {
            Text(
                stringResource(ResR.string.action_back),
                color = Color.textWhite,
                style = Type.bodyLarge.copy(fontWeight = FontWeight.Normal)
            )
        }
    }
}

@Composable
fun BreweryDetails(modifier: Modifier, breweryAddress: String) {
    Column(
        modifier = modifier
            .fillMaxWidth()
            .verticalScroll(rememberScrollState())
    ) {
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
fun BeveragesList(modifier: Modifier, beveragesList: List<BeverageModel>) {
    Column(modifier = modifier.fillMaxWidth()) {
        Text(
            stringResource(ResR.string.details_beverages),
            color = Color.textWhite,
            style = Type.bodyLarge,
            modifier = Modifier.padding(bottom = defaultGrid.grid_2)
        )
        beveragesList.forEach { beverage ->
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(vertical = defaultGrid.grid_2),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Text(beverage.name, color = Color.textWhite, style = Type.bodyNormal)
                Text(beverage.price, color = Color.tipColor, style = Type.bodyNormal)
            }
            HorizontalDivider(
                modifier = Modifier
                    .requiredHeight(0.5.dp)
                    .padding(bottom = defaultGrid.grid_2),
                color = Color.tipColor
            )
        }

    }
}

@Preview
@Composable
fun DetailsComposable_Preview() {
    val mockUiState = DetailsUiModel(
        breweryModel = BreweryModel(
            id = "",
            name = "BreweryStreet 1234",
            address = " random address"
        ),
        beverages = listOf(
            BeverageModel("Beer 50cl", price = "69 kr"),
            BeverageModel("Regular Pint 50cl", price = "69 kr"),
        )
    )
    DetailsComposable(mockUiState, onGoBack = {})
}

