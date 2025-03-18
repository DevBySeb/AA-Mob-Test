package aa.mob.test.domain.utils

interface Mapper<T, R> {
    fun map(source: T): R
}