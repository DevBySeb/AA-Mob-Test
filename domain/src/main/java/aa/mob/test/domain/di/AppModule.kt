package aa.mob.test.domain.di

import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import kotlinx.coroutines.CoroutineDispatcher
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.SupervisorJob
import javax.inject.Qualifier
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
class AppModule {

    @Provides
    @AppScope
    @Singleton
    fun provideJob(): Job = SupervisorJob()

    @Provides
    @AppScope
    @Singleton
    fun provideCoroutineDispatcher(): CoroutineDispatcher = Dispatchers.Main

    @Provides
    @AppScope
    @Singleton
    fun provideCoroutineScope(
        @AppScope job: Job,
        @AppScope dispatcher: CoroutineDispatcher,
    ) = CoroutineScope(job + dispatcher)
}

@Qualifier
@Retention(AnnotationRetention.RUNTIME)
annotation class AppScope