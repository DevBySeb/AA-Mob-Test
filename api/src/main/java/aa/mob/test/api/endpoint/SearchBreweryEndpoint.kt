package aa.mob.test.api.endpoint

import aa.mob.test.api.model.BreweryApiModel
import retrofit2.http.GET
import retrofit2.http.Path

interface SearchBreweryEndpoint {

    @GET("v1/breweries/autocomplete?per_page=5?query={search}&per_page=5")
    suspend fun getBreweries(@Path("search") search: String): BreweryApiModel
}