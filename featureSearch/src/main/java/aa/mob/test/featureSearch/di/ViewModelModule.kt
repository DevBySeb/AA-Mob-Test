package aa.mob.test.featureSearch.di

import aa.mob.test.featureSearch.event.handler.DefaultSearchEventHandler
import aa.mob.test.featureSearch.event.handler.SearchEventHandler
import aa.mob.test.featureSearch.factory.DefaultSearchScreenStateFactory
import aa.mob.test.featureSearch.factory.DefaultSearchScreenUiModelFactory
import aa.mob.test.featureSearch.model.SearchScreenUiModel
import aa.mob.test.featureSearch.state.SearchScreenState
import aa.mob.test.featureSearch.state.provider.DefaultSearchScreenStateProvider
import aa.mob.test.featureSearch.state.provider.SearchScreenStateProvider
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
        @ViewModelScoped
        fun provideJob(): Job = SupervisorJob()

        @Provides
        @ViewModelScoped
        fun provideCoroutineDispatcher(): CoroutineDispatcher = Dispatchers.Main

        @Provides
        @ViewModelScoped
        fun provideCoroutineScope(
            job: Job,
            dispatcher: CoroutineDispatcher,
        ) = CoroutineScope(job + dispatcher)
    }
}