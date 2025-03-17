package aa.mob.test.featureSearch.factory.details

import aa.mob.test.domain.model.BeverageModel
import aa.mob.test.featureSearch.model.details.DetailsUiModel
import javax.inject.Inject

class DefaultDetailsUiModelFactory @Inject constructor() : DetailsUiModel.Factory {

    override fun createEmpty(): DetailsUiModel = DetailsUiModel(null, mockBeverages)

    val mockBeverages = listOf(
        BeverageModel("Beer 50cl", price = "69 kr"),
        BeverageModel("Regular Pint 50cl", price = "69 kr"),
        BeverageModel("Beer 50cl", price = "69 kr"),
        BeverageModel("Beer 50cl", price = "69 kr"),
        BeverageModel("Beer 50cl", price = "69 kr"),
        BeverageModel("Beer 50cl", price = "69 kr"),
        BeverageModel("Beer 50cl", price = "69 kr"),
        BeverageModel("Beer 50cl", price = "69 kr"),
        )
}