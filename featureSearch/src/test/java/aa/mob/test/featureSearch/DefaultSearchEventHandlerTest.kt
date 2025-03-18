package aa.mob.test.featureSearch

import aa.mob.test.domain.model.BreweryModel
import aa.mob.test.domain.useCase.GetSuggestedBreweriesUseCase
import aa.mob.test.domain.useCase.InsertBreweryHistoryModelUseCase
import aa.mob.test.featureSearch.event.search.SearchScreenEvent
import aa.mob.test.featureSearch.event.search.handler.DefaultSearchEventHandler
import aa.mob.test.featureSearch.model.search.SearchScreenUiModel
import aa.mob.test.featureSearch.state.search.SearchScreenState
import aa.mob.test.featureSearch.state.search.provider.SearchScreenStateProvider
import androidx.compose.foundation.text.input.TextFieldState
import io.mockk.coEvery
import io.mockk.coJustRun
import io.mockk.coVerify
import io.mockk.every
import io.mockk.mockk
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.test.TestScope
import kotlinx.coroutines.test.UnconfinedTestDispatcher
import kotlinx.coroutines.test.advanceUntilIdle
import kotlinx.coroutines.test.resetMain
import kotlinx.coroutines.test.runTest
import kotlinx.coroutines.test.setMain
import org.junit.After
import org.junit.Before
import org.junit.Test

class DefaultSearchEventHandlerTest {

    private val searchScreenStateProvider: SearchScreenStateProvider = mockk(relaxed = true)
    private val getSuggestedBreweriesUseCase: GetSuggestedBreweriesUseCase = mockk()
    private val insertBreweryHistoryModelUseCase: InsertBreweryHistoryModelUseCase = mockk()

    @OptIn(ExperimentalCoroutinesApi::class)
    private val testDispatcher = UnconfinedTestDispatcher()
    private val testScope = TestScope(testDispatcher)

    private val handler = DefaultSearchEventHandler(
        searchScreenStateProvider,
        getSuggestedBreweriesUseCase,
        insertBreweryHistoryModelUseCase,
        testScope,
        testScope
    )

    @OptIn(ExperimentalCoroutinesApi::class)
    @Before
    fun setUp() {
        Dispatchers.setMain(testDispatcher)
    }

    @OptIn(ExperimentalCoroutinesApi::class)
    @After
    fun tearDown() {
        Dispatchers.resetMain()
    }

    @Test
    fun `ShowMoreClicked should fetch and update breweries`() = testScope.runTest {

        val existingBreweries = listOf(BreweryModel("", "Old Brewery", ""))
        val additionalBreweries = listOf(BreweryModel("", "New Brewery", ""))

        val uiModel = SearchScreenUiModel(
            breweries = existingBreweries,
            searchQuery = "test",
            isListExpanded = false,
            searchText = TextFieldState()
        )

        every { searchScreenStateProvider.screenState } returns MutableStateFlow(
            SearchScreenState(
                emptyList(), uiModel
            )
        )

        coEvery { getSuggestedBreweriesUseCase.invoke(any(), any()) } returns additionalBreweries


        handler.dispatchEvent(SearchScreenEvent.ShowMoreClicked)
        advanceUntilIdle()


        coVerify(exactly = 1) { getSuggestedBreweriesUseCase.invoke(any(), any()) }
        coVerify {
            searchScreenStateProvider.updateUiState(
                match {
                    it.breweries == existingBreweries + additionalBreweries &&
                            it.isListExpanded
                }
            )
        }

    }

    @Test
    fun `BreweryClicked should insert brewery into history`() = testScope.runTest {
        coJustRun { insertBreweryHistoryModelUseCase.invoke(any(), any()) }
        val event = SearchScreenEvent.BreweryClicked("id", "name")

        handler.dispatchEvent(event)

        coVerify(exactly = 1) {
            insertBreweryHistoryModelUseCase.invoke("name", "id")
        }

    }

    @Test
    fun `SearchBrewery should fetch and update UI state`() = testScope.runTest {

        val searchQuery = "beer"
        val breweries = listOf(BreweryModel("","Brewery A",""))
        val uiModel = SearchScreenUiModel(breweries = emptyList(), searchQuery = "", searchText = TextFieldState(), isListExpanded = false)

        every { searchScreenStateProvider.screenState } returns MutableStateFlow(SearchScreenState(
            emptyList(), uiModel))

        coEvery { getSuggestedBreweriesUseCase.invoke(any(), any()) } returns breweries

        handler.dispatchEvent(SearchScreenEvent.SearchBrewery(searchQuery))
        advanceUntilIdle()

        coVerify(exactly = 1) { getSuggestedBreweriesUseCase.invoke(any(), any()) }
        coVerify {
            searchScreenStateProvider.updateUiState(
                match {
                    it.breweries == breweries &&
                            it.searchQuery == searchQuery
                }
            )
        }
    }
}