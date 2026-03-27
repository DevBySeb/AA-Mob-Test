plugins {
    alias(libs.plugins.android.library)
    alias(libs.plugins.kotlin.android)
    alias(libs.plugins.compose.compiler)
}

apply {
    from("$rootDir/common-android-config.gradle")
}

android {
    namespace = "aa.mob.test.featureSearch"

    buildFeatures {
        compose = true
    }
}

dependencies {
    implementation(project(":resourcees"))
    implementation(project(":domain"))
    implementation(libs.androidx.core.ktx)
    implementation(libs.androidx.appcompat)
    testImplementation(libs.junit)
    androidTestImplementation(libs.androidx.junit)
    implementation(platform(libs.compose.bom))
    implementation(libs.composeRuntime)
    implementation(libs.composeUi)
    implementation(libs.composeMaterial3)
    implementation (libs.composeUiTooling)
    implementation(libs.mockk)
    implementation(libs.androidx.activity.compose)
    implementation(libs.hiltNavigationCompose)
    implementation(libs.coroutinesTest)
}