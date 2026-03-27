package aa.mob.test.api.di

import aa.mob.test.api.mapper.ApiToDomainMapper
import aa.mob.test.api.model.BreweryApiModel
import aa.mob.test.domain.model.BreweryModel
import aa.mob.test.domain.utils.Mapper
import dagger.Binds
import dagger.Module
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent

@Module
@InstallIn(SingletonComponent::class)
interface MapperModule {

    @Binds
    fun bindApiToDomainMapper(mapper: ApiToDomainMapper): Mapper<BreweryApiModel, BreweryModel>
}