plugins {
    alias(libs.plugins.android.library)
    alias(libs.plugins.kotlin.android)
}

apply {
    from("$rootDir/common-android-config.gradle")
}

android {
    namespace = "aa.mob.test.domain"
}

dependencies {
    
    testImplementation(libs.junit)
    androidTestImplementation(libs.androidx.junit)
}