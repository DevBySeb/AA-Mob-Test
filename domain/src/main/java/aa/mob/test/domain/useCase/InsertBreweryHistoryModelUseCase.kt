package aa.mob.test.domain.useCase

import aa.mob.test.domain.model.BreweryHistoryModel
import aa.mob.test.domain.repository.BreweryHistoryRepository
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter
import javax.inject.Inject

class InsertBreweryHistoryModelUseCase @Inject constructor(
    private val historyRepository: BreweryHistoryRepository,
    private val factory: BreweryHistoryModel.Factory
) {

    suspend operator fun invoke(name: String, id: String) =
        historyRepository.upsertHistory(
            factory.create(
                id,
                name,
                LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"))
            )
        )
}