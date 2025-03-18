package aa.mob.test.domain.repository

import aa.mob.test.domain.model.BreweryHistoryModel
import kotlinx.coroutines.flow.Flow

interface BreweryHistoryRepository {

    fun getHistory(): Flow<List<BreweryHistoryModel>>

    suspend fun upsertHistory(breweryHistoryModel: BreweryHistoryModel)
}