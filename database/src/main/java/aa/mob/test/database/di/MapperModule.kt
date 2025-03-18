package aa.mob.test.database.di

import aa.mob.test.database.mapper.DbToDomainMapper
import aa.mob.test.database.mapper.DomainToDbMapper
import aa.mob.test.database.model.BreweryHistoryDbModel
import aa.mob.test.domain.model.BreweryHistoryModel
import aa.mob.test.domain.utils.Mapper
import dagger.Binds
import dagger.Module
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent

@Module
@InstallIn(SingletonComponent::class)
interface MapperModule {


    @Binds
    fun bindDbToDomainMapper(mapper: DbToDomainMapper): Mapper<BreweryHistoryDbModel, BreweryHistoryModel>

    @Binds
    fun bindDomainToDbMapper(mapper: DomainToDbMapper): Mapper<BreweryHistoryModel, BreweryHistoryDbModel>
}