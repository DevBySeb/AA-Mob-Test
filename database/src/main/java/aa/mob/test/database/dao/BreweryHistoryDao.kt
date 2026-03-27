package aa.mob.test.database.dao

import aa.mob.test.database.model.BreweryHistoryDbModel
import aa.mob.test.database.model.BreweryHistoryDbModel.Companion.TABLE_NAME
import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import kotlinx.coroutines.flow.Flow

@Dao
interface BreweryHistoryDao {

    @Query("SELECT * FROM $TABLE_NAME")
    fun getBreweryHistory(): Flow<List<BreweryHistoryDbModel>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertBreweryHistory(breweryHistory: BreweryHistoryDbModel)
}