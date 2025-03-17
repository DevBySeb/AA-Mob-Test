package aa.mob.test.navigation

sealed class Destination(val path: String) {

    data object Search: Destination("search")
    data class Details(val breweryId: String): Destination("details/{id}") {
        fun getUri() = "details/$breweryId"
    }
}