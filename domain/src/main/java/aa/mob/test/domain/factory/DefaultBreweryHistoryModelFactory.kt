package aa.mob.test.domain.factory

import aa.mob.test.domain.model.BreweryHistoryModel
import javax.inject.Inject

class DefaultBreweryHistoryModelFactory @Inject constructor() : BreweryHistoryModel.Factory {
    override fun create(id: String, name: String, date: String): BreweryHistoryModel =
        BreweryHistoryModel(
            id, name, date
        )
}