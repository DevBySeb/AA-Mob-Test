package aa.mob.test.api.di

import aa.mob.test.api.endpoint.SearchBreweryEndpoint
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import retrofit2.Retrofit

@InstallIn(SingletonComponent::class)
@Module
object EndpointModule {

    @Provides
    fun provideSearchBreweryEndpoint(retrofit: Retrofit) =
        retrofit.create(SearchBreweryEndpoint::class.java)
}