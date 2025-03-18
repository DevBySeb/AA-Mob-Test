package aa.mob.test.database

import aa.mob.test.database.dao.BreweryHistoryDao
import aa.mob.test.database.model.BreweryHistoryDbModel
import androidx.room.Database
import androidx.room.RoomDatabase

@Database(
    version = 1,
    entities = [BreweryHistoryDbModel::class]
)
abstract class BreweryDatabase: RoomDatabase() {

    abstract fun getBreweryHistoryDao(): BreweryHistoryDao
}