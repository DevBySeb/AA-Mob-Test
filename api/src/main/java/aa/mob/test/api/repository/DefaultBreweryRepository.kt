package aa.mob.test.api.repository

import aa.mob.test.api.endpoint.BreweryEndpoint
import aa.mob.test.api.model.BreweryApiModel
import aa.mob.test.domain.model.BreweryModel
import aa.mob.test.domain.repository.BreweryRepository
import aa.mob.test.domain.utils.Mapper
import javax.inject.Inject

class DefaultBreweryRepository @Inject constructor(
    private val breweryEndpoint: BreweryEndpoint,
    private val mapper: Mapper<BreweryApiModel, BreweryModel>
) : BreweryRepository {

    override suspend fun getSuggestedBreweries(
        search: String,
        page: Int
    ): List<BreweryModel> = breweryEndpoint.getBreweries(search, page).map { mapper.map(it) }

    override suspend fun getBrewery(id: String): BreweryModel =
        mapper.map(breweryEndpoint.getBrewery(id))

}