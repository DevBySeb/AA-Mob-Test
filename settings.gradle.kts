pluginManagement {
    repositories {
        google {
            content {
                includeGroupByRegex("com\\.android.*")
                includeGroupByRegex("com\\.google.*")
                includeGroupByRegex("androidx.*")
            }
        }
        mavenCentral()
        gradlePluginPortal()
    }
}
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
    }
    versionCatalogs {
        create("lol") {
            from(files("gradle/lol.versions.toml"))
        }
    }

}

rootProject.name = "AA-Mob-Test"
include(":app")
include(":featureSearch")
include(":api")
include(":resourcees")
include(":domain")
include(":common-android-config")
