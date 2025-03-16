package aa.mob.test.featureSearch.state

import aa.mob.test.domain.model.BreweryModel
import aa.mob.test.featureSearch.model.SearchScreenUiModel

data class SearchScreenState(
    private val suggestedBreweries: List<BreweryModel>,
    private val uiModel: SearchScreenUiModel
)
