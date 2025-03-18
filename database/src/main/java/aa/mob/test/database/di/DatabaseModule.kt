package aa.mob.test.database.di

import aa.mob.test.database.BreweryDatabase
import android.content.Context
import androidx.room.Room
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
class DatabaseModule {

    @Provides
    @Singleton
    fun provideDefaultBreweryDatabase(
        @ApplicationContext context: Context,
    ): BreweryDatabase =
        Room.databaseBuilder(
            context.applicationContext,
            BreweryDatabase::class.java,
            "brewery_database"
        ).build()

    @Provides
    fun provideBreweryHistoryDao(database: BreweryDatabase) = database.getBreweryHistoryDao()
}