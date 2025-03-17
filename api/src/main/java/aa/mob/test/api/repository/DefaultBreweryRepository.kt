package aa.mob.test.api.repository

import aa.mob.test.api.endpoint.SearchBreweryEndpoint
import aa.mob.test.api.model.BreweryApiModel
import aa.mob.test.domain.model.BreweryModel
import aa.mob.test.domain.repository.BreweryRepository
import aa.mob.test.domain.utils.Mapper
import android.util.Log
import javax.inject.Inject

class DefaultBreweryRepository @Inject constructor(
    private val breweryEndpoint: SearchBreweryEndpoint,
    private val mapper: Mapper<BreweryApiModel, BreweryModel>
) : BreweryRepository {

    override suspend fun getSuggestedBreweries(
        search: String,
        page: Int
    ): List<BreweryModel> = breweryEndpoint.getBreweries(search, page).map { mapper.map(it) }.also { Log.d("xddd",it.toString()) }
}