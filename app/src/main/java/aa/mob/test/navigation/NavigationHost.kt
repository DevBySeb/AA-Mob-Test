package aa.mob.test.navigation

import aa.mob.test.featureSearch.ui.details.DetailsScreen
import aa.mob.test.featureSearch.ui.search.SearchScreen
import androidx.compose.foundation.layout.padding
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController

@Composable
fun AppNavHost(modifier: Modifier) {
    val navController = rememberNavController()

    NavHost(navController = navController, startDestination = Destination.Search.path, modifier = modifier) {
        composable(Destination.Search.path) {
            SearchScreen {
                navController.navigate(Destination.Details.navigate(it))
            }
        }
        composable(Destination.Details.path) {
            val id = it.arguments?.getString(ID_ARGUMENT) ?: ""
            DetailsScreen(breweryId = id) { navController.popBackStack() }
        }
    }
}