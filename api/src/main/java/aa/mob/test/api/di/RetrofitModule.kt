package aa.mob.test.api.di

import aa.mob.test.api.utils.Constants.NETWORK_READ_TIMEOUT
import aa.mob.test.api.utils.Constants.NETWORK_WRITE_TIMEOUT
import android.content.Context
import com.squareup.moshi.Moshi
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import okhttp3.OkHttpClient
import retrofit2.Retrofit
import retrofit2.converter.moshi.MoshiConverterFactory
import java.util.concurrent.TimeUnit
import javax.inject.Named
import javax.inject.Singleton
import aa.mob.test.resources.R as ResR

const val BASE_URL = "baseUrl"

@Module
@InstallIn(SingletonComponent::class)
object RetrofitModule {

    @Provides
    @Named(BASE_URL)
    fun provideUrl(@ApplicationContext appContext: Context): String =
        appContext.getString(ResR.string.base_api_url)

    @Provides
    @Singleton
    fun provideOkHttpClient(): OkHttpClient {
        return OkHttpClient.Builder().apply {
            writeTimeout(NETWORK_WRITE_TIMEOUT, TimeUnit.SECONDS)
            readTimeout(NETWORK_READ_TIMEOUT, TimeUnit.SECONDS)
        }.build()
    }

    @Provides
    @Singleton
    fun provideRetrofit(
        client: OkHttpClient,
        @Named(BASE_URL) baseUrl: String,
    ): Retrofit {
        return Retrofit.Builder().apply {
            client(client)
            baseUrl(baseUrl)
        }.build()
    }
}