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

    composeOptions {
        //     kotlinCompilerExtensionVersion = libs.versions.kotlinCompilerExtensionVersion.version
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_18
        targetCompatibility = JavaVersion.VERSION_18
    }
    kotlinOptions {
        jvmTarget = "18"
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
    testImplementation(libs.junit)
    androidTestImplementation(libs.androidx.junit)
    implementation(platform(libs.compose.bom))
    implementation(libs.composeRuntime)
    implementation(libs.composeUi)
    implementation(libs.composeMaterial3)
    implementation(libs.composeUiTooling)
    implementation(libs.androidx.activity.compose)
    implementation(libs.hiltNavigationCompose)
}