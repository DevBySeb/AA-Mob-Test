package aa.mob.test.domain.useCase

import aa.mob.test.domain.model.BreweryHistoryModel
import aa.mob.test.domain.repository.BreweryHistoryRepository
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject

class GetBreweryHistoryUseCase @Inject constructor(private val historyRepository: BreweryHistoryRepository) {

    operator fun invoke(): Flow<List<BreweryHistoryModel>> = historyRepository.getHistory()
}