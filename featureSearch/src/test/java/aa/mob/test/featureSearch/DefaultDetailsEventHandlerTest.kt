package aa.mob.test.featureSearch

import aa.mob.test.domain.model.BreweryModel
import aa.mob.test.domain.useCase.GetBreweryUseCase
import aa.mob.test.featureSearch.event.details.DetailsEvent
import aa.mob.test.featureSearch.event.details.handler.DefaultDetailsEventHandler
import aa.mob.test.featureSearch.model.details.DetailsUiModel
import aa.mob.test.featureSearch.state.details.DetailsScreenStateProvider
import io.mockk.coEvery
import io.mockk.coVerify
import io.mockk.every
import io.mockk.mockk
import io.mockk.verify
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.test.TestScope
import kotlinx.coroutines.test.UnconfinedTestDispatcher
import kotlinx.coroutines.test.runTest
import org.junit.Before
import org.junit.Test

class DefaultDetailsEventHandlerTest {

    private val stateProvider: DetailsScreenStateProvider = mockk()


    private val getBreweryUseCase: GetBreweryUseCase = mockk()

    @OptIn(ExperimentalCoroutinesApi::class)
    private val testDispatcher = UnconfinedTestDispatcher()
    private val testScope = TestScope(testDispatcher)

    private val eventHandler: DefaultDetailsEventHandler =
        DefaultDetailsEventHandler(testScope, stateProvider, getBreweryUseCase)

    @Before
    fun setUp() {
        every { stateProvider.screenState } returns MutableStateFlow(DetailsUiModel(null, emptyList()))
    }

    @Test
    fun `dispatchEvent Init should update UI state with brewery data`() = runTest {
        val breweryId = "123"
        val brewery = BreweryModel(id = "", name = "Test Brewery", "")
        coEvery { getBreweryUseCase.invoke(any()) } returns brewery

        eventHandler.dispatchEvent(DetailsEvent.Init(breweryId))

        coVerify { getBreweryUseCase.invoke(breweryId) }

        verify { stateProvider.updateUiState(match { it.breweryModel == brewery }) }
    }
}