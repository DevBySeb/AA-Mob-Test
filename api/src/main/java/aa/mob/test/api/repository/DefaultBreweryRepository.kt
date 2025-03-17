package aa.mob.test.api.repository

import aa.mob.test.api.endpoint.SearchBreweryEndpoint
import aa.mob.test.api.model.BreweryApiModel
import aa.mob.test.domain.model.BreweryModel
import aa.mob.test.domain.repository.BreweryRepository
import aa.mob.test.domain.utils.Mapper
import javax.inject.Inject

class DefaultBreweryRepository @Inject constructor(
    private val breweryEndpoint: SearchBreweryEndpoint,
    private val mapper: Mapper<BreweryApiModel, BreweryModel>
) : BreweryRepository {

    override suspend fun getSuggestedBreweries(
        search: String,
    ): List<BreweryModel> = breweryEndpoint.getBreweries(search).map { mapper.map(it) }
}