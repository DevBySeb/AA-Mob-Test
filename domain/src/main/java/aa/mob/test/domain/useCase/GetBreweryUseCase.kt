package aa.mob.test.domain.useCase

import aa.mob.test.domain.repository.BreweryRepository
import javax.inject.Inject

class GetBreweryUseCase @Inject constructor(private val breweryRepository: BreweryRepository) {

    suspend operator fun invoke(id: String) = breweryRepository.getBrewery(id)
}