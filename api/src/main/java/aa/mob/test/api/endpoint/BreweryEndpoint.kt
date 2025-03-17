package aa.mob.test.api.endpoint

import aa.mob.test.api.model.BreweryApiModel
import retrofit2.http.GET
import retrofit2.http.Path
import retrofit2.http.Query

interface BreweryEndpoint {

    @GET("/v1/breweries/search?per_page=5")
    suspend fun getBreweries(
        @Query("query") search: String,
        @Query("page") page: Int
    ): List<BreweryApiModel>

    @GET("/v1/breweries/{id}")
    suspend fun getBrewery(@Path("id") id: String): BreweryApiModel
}