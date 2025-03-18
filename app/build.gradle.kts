plugins {
    alias(libs.plugins.android.application)
    alias(libs.plugins.kotlin.android)
    alias(libs.plugins.compose.compiler)
}

apply {
    from("$rootDir/common-android-config.gradle")
}

android {
    namespace = "com.aa.mob.test"

    buildFeatures {
        compose = true
    }

    packaging {
        resources {
            excludes += setOf("META-INF/LICENSE.md","META-INF/LICENSE-notice.md", "META-INF/DEPENDENCIES")
        }
    }

}

dependencies {

    implementation(project(":featureSearch"))
    implementation(project(":domain"))
    implementation(project(":resourcees"))
    implementation(project(":api"))
    implementation(project(":database"))

    implementation(libs.androidx.core.ktx)
    implementation(libs.androidx.appcompat)
    implementation(libs.androidx.navigation.compose)
    implementation(platform(libs.compose.bom))
    implementation(libs.composeRuntime)
    implementation(libs.composeUi)
    implementation(libs.composeMaterial3)
    implementation(libs.androidx.activity.compose)
    implementation(libs.hiltNavigationCompose)
}