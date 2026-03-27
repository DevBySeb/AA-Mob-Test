package aa.mob.test.featureSearch.di.details

import aa.mob.test.featureSearch.event.details.handler.DefaultDetailsEventHandler
import aa.mob.test.featureSearch.event.details.handler.DetailsEventHandler
import aa.mob.test.featureSearch.factory.details.DefaultDetailsUiModelFactory
import aa.mob.test.featureSearch.model.details.DetailsUiModel
import aa.mob.test.featureSearch.state.details.DefaultDetailsScreenStateProvider
import aa.mob.test.featureSearch.state.details.DetailsScreenStateProvider
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
    fun bindScreenStateProvider(provider: DefaultDetailsScreenStateProvider): DetailsScreenStateProvider

    @Binds
    fun bindDetailsScreenUiModelFactory(factory: DefaultDetailsUiModelFactory): DetailsUiModel.Factory

    @Binds
    fun bindDetailsEventHandler(handler: DefaultDetailsEventHandler): DetailsEventHandler

    companion object {

        @Provides
        @Details
        @ViewModelScoped
        fun provideJob(): Job = SupervisorJob()

        @Provides
        @Details
        @ViewModelScoped
        fun provideCoroutineDispatcher(): CoroutineDispatcher = Dispatchers.Main

        @Provides
        @Details
        @ViewModelScoped
        fun provideCoroutineScope(
            @Details job: Job,
            @Details dispatcher: CoroutineDispatcher,
        ) = CoroutineScope(job + dispatcher)
    }
}

@Qualifier
@Retention(AnnotationRetention.RUNTIME)
annotation class Details