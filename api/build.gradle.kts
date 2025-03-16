plugins {
    alias(libs.plugins.android.library)
    alias(libs.plugins.kotlin.android)
    alias(libs.plugins.hilt)
}

apply {
    from("$rootDir/common-android-config.gradle")
}

android {
    namespace = "aa.mob.test.api"
}

dependencies {
    implementation(project(":resourcees"))
    implementation(project(":domain"))
    implementation(libs.androidx.core.ktx)
    implementation(libs.androidx.appcompat)
    implementation(libs.retrofit)
    implementation(libs.retrofitMoshi)
}