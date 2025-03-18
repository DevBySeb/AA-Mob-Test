package aa.mob.test.database.di

import aa.mob.test.database.repository.DefaultBreweryHistoryRepository
import aa.mob.test.domain.repository.BreweryHistoryRepository
import dagger.Binds
import dagger.Module
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent

@Module
@InstallIn(SingletonComponent::class)
interface RepositoryModule {

    @Binds
    fun bindBreweryHistoryRepository(repository: DefaultBreweryHistoryRepository): BreweryHistoryRepository
}