package aa.mob.test.database.mapper

import aa.mob.test.database.model.BreweryHistoryDbModel
import aa.mob.test.domain.model.BreweryHistoryModel
import aa.mob.test.domain.utils.Mapper
import javax.inject.Inject

class DomainToDbMapper @Inject constructor(): Mapper<BreweryHistoryModel, BreweryHistoryDbModel> {

    override fun map(source: BreweryHistoryModel): BreweryHistoryDbModel = BreweryHistoryDbModel(
        source.id,
        source.name,
        source.date
    )
}