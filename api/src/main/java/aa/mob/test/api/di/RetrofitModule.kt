package aa.mob.test.api.di

import aa.mob.test.api.utils.Constants.NETWORK_READ_TIMEOUT
import aa.mob.test.api.utils.Constants.NETWORK_WRITE_TIMEOUT
import android.content.Context
import com.squareup.moshi.Moshi
import dagger.Provides
import dagger.hilt.android.qualifiers.ApplicationContext
import okhttp3.OkHttpClient
import retrofit2.Retrofit
import retrofit2.converter.moshi.MoshiConverterFactory
import java.util.concurrent.TimeUnit
import javax.inject.Singleton
import aa.mob.test.resources.R as ResR

@Provides
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
    moshi: Moshi,
    baseUrl: String,
): Retrofit {
    return Retrofit.Builder().apply {
        addConverterFactory(MoshiConverterFactory.create(moshi))
        client(client)
        baseUrl(baseUrl)
    }.build()
}