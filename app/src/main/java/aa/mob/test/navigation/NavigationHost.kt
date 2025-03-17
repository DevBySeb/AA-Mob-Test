package aa.mob.test.navigation

import aa.mob.test.featureSearch.ui.details.DetailsScreen
import aa.mob.test.featureSearch.ui.search.SearchScreen
import androidx.compose.runtime.Composable
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController

@Composable
fun AppNavHost() {
    val navController = rememberNavController()

    NavHost(navController = navController, startDestination = Destination.Search.path) {
        composable(Destination.Search.path) {
            SearchScreen {
                navController.navigate(Destination.Details(it).getUri())
            }
        }
        composable("details/{id}") {
            DetailsScreen()
        }
    }
}