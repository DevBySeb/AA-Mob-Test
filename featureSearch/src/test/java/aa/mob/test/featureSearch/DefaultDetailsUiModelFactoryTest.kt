package aa.mob.test.featureSearch

import aa.mob.test.featureSearch.factory.details.DefaultDetailsUiModelFactory
import org.junit.Assert.assertEquals
import org.junit.Test

class DefaultDetailsUiModelFactoryTest {

    private val factory: DefaultDetailsUiModelFactory = DefaultDetailsUiModelFactory()

    @Test
    fun `createEmpty should return DetailsUiModel with null brewery and mock beverages`() {
        val result = factory.createEmpty()

        assertEquals(null, result.breweryModel)
        assertEquals(8, result.beverages.size)
        assertEquals("Beer 50cl", result.beverages[0].name)
        assertEquals("69 kr", result.beverages[0].price)
    }
}