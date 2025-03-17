package aa.mob.test.resources.theme

import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.lightColorScheme
import androidx.compose.runtime.Composable

private val LightColorScheme = lightColorScheme(
    primary = aa.mob.test.resources.theme.Color.background,
    secondary = aa.mob.test.resources.theme.Color.textWhite,
    tertiary = aa.mob.test.resources.theme.Color.buttonColorPrimary
)

@Composable
fun AATestTheme(
    content: @Composable () -> Unit
) {

    MaterialTheme(
        colorScheme = LightColorScheme,
        content = content
    )
}