package aa.mob.test.domain.useCase

import aa.mob.test.domain.repository.BreweryRepository

class GetSuggestedBreweriesUseCase @Inject constructor(private val repository: BreweryRepository) {

    suspend operator fun invoke(search: String) =
        kotlin.runCatching {
            repository.getSuggestedBreweries(search)
        }
}