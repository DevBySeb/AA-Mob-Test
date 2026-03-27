package aa.mob.test.featureSearch

import aa.mob.test.domain.model.BreweryModel
import aa.mob.test.featureSearch.factory.search.DefaultSearchScreenUiModelFactory
import org.junit.Assert.assertEquals
import org.junit.Test

class DefaultSearchScreenUiModelFactoryTest {

    private val factory: DefaultSearchScreenUiModelFactory = DefaultSearchScreenUiModelFactory()

    @Test
    fun `createEmpty should return default empty SearchScreenUiModel`() {
        val result = factory.createEmpty()

        assertEquals("", result.searchText.text)
        assertEquals(false, result.isListExpanded)
        assertEquals("", result.searchQuery)
        assertEquals(emptyList<BreweryModel>(), result.breweries)
    }
}