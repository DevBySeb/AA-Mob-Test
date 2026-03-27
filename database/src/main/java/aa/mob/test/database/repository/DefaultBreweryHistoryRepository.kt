package aa.mob.test.database.repository

import aa.mob.test.database.dao.BreweryHistoryDao
import aa.mob.test.database.model.BreweryHistoryDbModel
import aa.mob.test.domain.model.BreweryHistoryModel
import aa.mob.test.domain.repository.BreweryHistoryRepository
import aa.mob.test.domain.utils.Mapper
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.withContext
import javax.inject.Inject

class DefaultBreweryHistoryRepository @Inject constructor(
    private val dao: BreweryHistoryDao,
    private val dbToDomainMapper: Mapper<BreweryHistoryDbModel, BreweryHistoryModel>,
    private val domainToDbMapper: Mapper<BreweryHistoryModel, BreweryHistoryDbModel>
) : BreweryHistoryRepository {
    override fun getHistory(): Flow<List<BreweryHistoryModel>> =
        dao.getBreweryHistory().map { it.map { breweryDbModel ->  dbToDomainMapper.map(breweryDbModel) } }

    override suspend fun upsertHistory(breweryHistoryModel: BreweryHistoryModel) =
        withContext(Dispatchers.IO) {
            dao.insertBreweryHistory(domainToDbMapper.map(breweryHistoryModel))
        }
}