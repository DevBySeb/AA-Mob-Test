package aa.mob.test.domain.repository

import aa.mob.test.domain.model.BreweryModel

interface BreweryRepository {

    suspend fun getSuggestedBreweries(search: String): List<BreweryModel>
}