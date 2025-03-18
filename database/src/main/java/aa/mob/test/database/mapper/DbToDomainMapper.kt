package aa.mob.test.database.mapper

import aa.mob.test.database.model.BreweryHistoryDbModel
import aa.mob.test.domain.model.BreweryHistoryModel
import aa.mob.test.domain.utils.Mapper
import javax.inject.Inject

class DbToDomainMapper @Inject constructor() : Mapper<BreweryHistoryDbModel, BreweryHistoryModel> {
    override fun map(source: BreweryHistoryDbModel): BreweryHistoryModel = BreweryHistoryModel(
        id = source.id,
        name = source.name,
        date = source.date
    )
}