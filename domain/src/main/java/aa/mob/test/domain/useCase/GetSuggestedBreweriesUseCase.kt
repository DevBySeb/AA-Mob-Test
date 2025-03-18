package aa.mob.test.domain.useCase

import aa.mob.test.domain.repository.BreweryRepository
import javax.inject.Inject

class GetSuggestedBreweriesUseCase @Inject constructor(private val repository: BreweryRepository) {

    suspend operator fun invoke(search: String, page: Int) =
        kotlin.runCatching { repository.getSuggestedBreweries(search, page) }.getOrDefault(emptyList())

}