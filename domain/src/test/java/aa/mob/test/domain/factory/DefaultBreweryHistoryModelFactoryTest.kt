package aa.mob.test.domain.factory

import org.junit.Assert
import org.junit.Test

class DefaultBreweryHistoryModelFactoryTest {

    private val factory = DefaultBreweryHistoryModelFactory()

    @Test
    fun `create brewery history model`() {
        val id = "id"
        val name = "name"
        val date = "2005-02-01 08:00"
       val model =  factory.create(id,name,date)

        Assert.assertSame(id, model.id)
        Assert.assertSame(name, model.name)
        Assert.assertSame(date, model.date)
    }
}