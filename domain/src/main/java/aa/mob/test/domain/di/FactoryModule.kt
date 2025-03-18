package aa.mob.test.domain.di

import aa.mob.test.domain.factory.DefaultBreweryHistoryModelFactory
import aa.mob.test.domain.model.BreweryHistoryModel
import dagger.Binds
import dagger.Module
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent

@InstallIn(SingletonComponent::class)
@Module
interface FactoryModule {

    @Binds
    fun bindBreweryHistoryModelFactory(factory: DefaultBreweryHistoryModelFactory): BreweryHistoryModel.Factory
}