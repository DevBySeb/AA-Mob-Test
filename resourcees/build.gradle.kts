plugins {
    alias(libs.plugins.android.library)
    alias(libs.plugins.kotlin.android)
}

apply {
    from("$rootDir/common-android-config.gradle")
}

android {
    namespace = "aa.mob.test.resources"
}
dependencies {

    implementation(platform(libs.compose.bom))
    implementation(libs.composeUi)
    implementation(libs.composeMaterial3)
}