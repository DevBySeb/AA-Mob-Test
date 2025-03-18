package aa.mob.test.api.mapper

import aa.mob.test.api.model.BreweryApiModel
import aa.mob.test.domain.model.BreweryModel
import aa.mob.test.domain.utils.Mapper
import javax.inject.Inject

class ApiToDomainMapper @Inject constructor() : Mapper<BreweryApiModel, BreweryModel> {
    override fun map(source: BreweryApiModel): BreweryModel = BreweryModel(
        id = source.id,
        name = source.name,
        address = source.address ?: "Unknown"
    )
}