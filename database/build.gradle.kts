plugins {
    alias(libs.plugins.ksp)
    alias(libs.plugins.android.library)
    alias(libs.plugins.kotlin.android)
}

apply {
    from("$rootDir/common-android-config.gradle")
}

android {
    namespace = "aa.mob.test.database"
}

dependencies {

    implementation(project(":domain"))
    testImplementation(libs.junit)
    api(libs.room)
    api(libs.roomKtx)
    ksp(libs.roomCompiler)
    androidTestImplementation(libs.androidx.junit)
}