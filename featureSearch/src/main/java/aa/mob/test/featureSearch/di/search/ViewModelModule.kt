package aa.mob.test.featureSearch.di.search

import aa.mob.test.featureSearch.event.search.handler.DefaultSearchEventHandler
import aa.mob.test.featureSearch.event.search.handler.SearchEventHandler
import aa.mob.test.featureSearch.factory.search.DefaultSearchScreenStateFactory
import aa.mob.test.featureSearch.factory.search.DefaultSearchScreenUiModelFactory
import aa.mob.test.featureSearch.model.search.SearchScreenUiModel
import aa.mob.test.featureSearch.state.search.SearchScreenState
import aa.mob.test.featureSearch.state.search.provider.DefaultSearchScreenStateProvider
import aa.mob.test.featureSearch.state.search.provider.SearchScreenStateProvider
import dagger.Binds
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.components.ViewModelComponent
import dagger.hilt.android.scopes.ViewModelScoped
import kotlinx.coroutines.CoroutineDispatcher
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.SupervisorJob
import javax.inject.Qualifier

@Module
@InstallIn(ViewModelComponent::class)
interface ViewModelModule {

    @Binds
    fun bindScreenStateProvider(provider: DefaultSearchScreenStateProvider): SearchScreenStateProvider

    @Binds
    fun bindScreenStateFactory(factory: DefaultSearchScreenStateFactory): SearchScreenState.Factory

    @Binds
    fun bindSearchScreenUiModelFactory(factory: DefaultSearchScreenUiModelFactory): SearchScreenUiModel.Factory

    @Binds
    fun bindSearchEventHandler(handler: DefaultSearchEventHandler): SearchEventHandler

    companion object {

        @Provides
        @Search
        @ViewModelScoped
        fun provideJob(): Job = SupervisorJob()

        @Provides
        @Search
        @ViewModelScoped
        fun provideCoroutineDispatcher(): CoroutineDispatcher = Dispatchers.Main

        @Provides
        @Search
        @ViewModelScoped
        fun provideCoroutineScope(
            @Search job: Job,
            @Search dispatcher: CoroutineDispatcher,
        ) = CoroutineScope(job + dispatcher)
    }
}

@Qualifier
@Retention(AnnotationRetention.RUNTIME)
annotation class Search