package aa.mob.test.featureSearch

import aa.mob.test.domain.model.BreweryHistoryModel
import aa.mob.test.domain.model.BreweryModel
import aa.mob.test.featureSearch.factory.search.DefaultSearchScreenStateFactory
import aa.mob.test.featureSearch.model.search.SearchScreenUiModel
import androidx.compose.foundation.text.input.TextFieldState
import org.junit.Assert.assertEquals
import org.junit.Test

class DefaultSearchScreenStateFactoryTest {

    private val factory: DefaultSearchScreenStateFactory = DefaultSearchScreenStateFactory()

    @Test
    fun `createEmpty should return state with empty breweries list`() {
        val emptyUiModel = SearchScreenUiModel(
            searchQuery = "Empty State", breweries = listOf(
                BreweryModel("123", name = "random name", address = "address")
            ), searchText = TextFieldState("random text"), isListExpanded = true
        )

        val result = factory.createEmpty(emptyUiModel)

        assertEquals(emptyUiModel, result.uiModel)
        assertEquals(emptyList<BreweryHistoryModel>(), result.breweriesHistory)
    }

    @Test
    fun `create should return state with provided UI model and brewery history`() {
        val uiModel = SearchScreenUiModel(
            searchQuery = "Empty State",
            breweries = emptyList(),
            searchText = TextFieldState("random text"),
            isListExpanded = true
        )
        val breweryHistoryList = listOf(
            BreweryHistoryModel(id = "1", name = "Brewery One", ""),
            BreweryHistoryModel(id = "2", name = "Brewery Two", "")
        )

        val result = factory.create(uiModel, breweryHistoryList)

        assertEquals(uiModel, result.uiModel)
        assertEquals(breweryHistoryList, result.breweriesHistory)
    }
}