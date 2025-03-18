package aa.mob.test.featureSearch.model.details

import aa.mob.test.domain.model.BeverageModel
import aa.mob.test.domain.model.BreweryModel

data class DetailsUiModel(val breweryModel: BreweryModel?, val beverages: List<BeverageModel>) {

    interface Factory {
        fun createEmpty(): DetailsUiModel
    }
}