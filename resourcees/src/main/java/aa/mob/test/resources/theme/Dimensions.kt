package aa.mob.test.resources.theme

import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp

@Suppress("ConstructorParameterNaming")
class Grid(
    val grid_0_25: Dp,
    val grid_0_5: Dp,
    val grid_1: Dp,
    val grid_1_5: Dp,
    val grid_2: Dp,
    val grid_2_5: Dp,
    val grid_3: Dp,
    val grid_4: Dp,
    val grid_4_5: Dp,
    val grid_5: Dp,
    val grid_6: Dp,
    val grid_6_5: Dp,
    val grid_7: Dp,
    val grid_7_5: Dp,
    val grid_10: Dp,
    val grid_15: Dp,
    val grid_20: Dp,
)

val defaultGrid: Grid = Grid(
    grid_0_25 = 1.dp,
    grid_0_5 = 2.dp,
    grid_1 = 4.dp,
    grid_1_5 = 6.dp,
    grid_2 = 8.dp,
    grid_2_5 = 10.dp,
    grid_3 = 12.dp,
    grid_4 = 16.dp,
    grid_4_5 = 18.dp,
    grid_5 = 20.dp,
    grid_6 = 24.dp,
    grid_6_5 = 26.dp,
    grid_7 = 28.dp,
    grid_7_5 = 30.dp,
    grid_10 = 40.dp,
    grid_15 = 60.dp,
    grid_20 = 80.dp
)