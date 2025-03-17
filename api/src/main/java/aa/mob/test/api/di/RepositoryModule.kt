package aa.mob.test.api.di

import aa.mob.test.api.repository.DefaultBreweryRepository
import aa.mob.test.domain.repository.BreweryRepository
import dagger.Binds
import dagger.Module
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent

@InstallIn(SingletonComponent::class)
@Module
interface RepositoryModule {

    @Binds
    fun bindBreweryRepository(repositoryImpl: DefaultBreweryRepository): BreweryRepository
}