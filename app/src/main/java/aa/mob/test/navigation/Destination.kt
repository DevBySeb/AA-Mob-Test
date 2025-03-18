package aa.mob.test.navigation

const val ID_ARGUMENT = "id"

sealed class Destination(val path: String) {

    data object Search : Destination("search")
    data object Details : Destination("details/{$ID_ARGUMENT}") {
        fun navigate(breweryId: String) = "details/$breweryId"
    }
}