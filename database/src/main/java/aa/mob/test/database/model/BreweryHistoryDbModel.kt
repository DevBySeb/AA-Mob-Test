package aa.mob.test.database.model

import aa.mob.test.database.model.BreweryHistoryDbModel.Companion.TABLE_NAME
import androidx.room.Entity
import androidx.room.PrimaryKey


@Entity(tableName = TABLE_NAME)
data class BreweryHistoryDbModel(
    @PrimaryKey(autoGenerate = false)
    val id: String,
    val name: String,
    val date: String
) {

    companion object {
        const val TABLE_NAME = "breweryHistory"
    }
}

