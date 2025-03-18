package aa.mob.test.domain.model

data class BreweryHistoryModel(
    val id: String,
    val name: String,
    val date: String,
) {
    interface Factory {
        fun create(
            id: String,
            name: String,
            date: String,
        ): BreweryHistoryModel
    }
}