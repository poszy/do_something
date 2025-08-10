package com.example.android.xrfundamentals
import androidx.compose.material3.Surface
import androidx.compose.material3.adaptive.currentWindowAdaptiveInfo
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.window.core.layout.WindowSizeClass
import androidx.window.core.layout.WindowWidthSizeClass
import androidx.xr.compose.platform.LocalSession
import androidx.xr.compose.platform.LocalSpatialCapabilities
import androidx.xr.compose.spatial.Subspace
import androidx.xr.compose.subspace.SpatialCurvedRow
import androidx.xr.compose.subspace.SpatialPanel
import androidx.xr.compose.subspace.layout.SubspaceModifier
import androidx.xr.compose.subspace.layout.height
import androidx.xr.compose.subspace.layout.width
import androidx.xr.scenecore.scene
import com.example.android.xrfundamentals.environment.ENVIRONMENT_OPTIONS
import com.example.android.xrfundamentals.ui.component.EnvironmentSelectionOrbiter
import com.example.android.xrfundamentals.ui.component.PrimaryCard
import com.example.android.xrfundamentals.ui.component.SecondaryCardList
import com.example.android.xrfundamentals.ui.component.XRFundamentalsTopAppBar
import com.example.android.xrfundamentals.ui.layout.CompactLayout
import com.example.android.xrfundamentals.ui.layout.ExpandedLayout
import kotlinx.coroutines.launch
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.Scaffold
@Composable
fun XRFundamentalsApp(
    windowSizeClass: WindowSizeClass = currentWindowAdaptiveInfo().windowSizeClass
) {

    Scaffold(
        topBar = { XRFundamentalsTopAppBar() }
    ) { innerPadding ->

        val modifier = Modifier
            .padding(innerPadding)
            .fillMaxSize()

        if (windowSizeClass.windowWidthSizeClass == WindowWidthSizeClass.COMPACT) {
            CompactLayout(
                modifier = modifier,
                primaryContent = {
                    PrimaryCard()
                },
                secondaryContent = {
                    SecondaryCardList()
                }
            )
        } else {
            ExpandedLayout(
                modifier = modifier,
                primaryContent = {
                    PrimaryCard(
                        modifier = Modifier.verticalScroll(rememberScrollState())
                    )
                },
                secondaryContent = {
                    SecondaryCardList(
                        modifier = Modifier.verticalScroll(rememberScrollState())
                    )
                }
            )
        }
    }

    var currentEnvironmentOptionIndex by remember { mutableStateOf(0) }
    Subspace {
        val session = checkNotNull(LocalSession.current)
        val scope = rememberCoroutineScope()

        SpatialCurvedRow(
            curveRadius = 825.dp
        ) {
            SpatialPanel(
                modifier = SubspaceModifier
                    .width(1024.dp)
                    .height(800.dp)
            ) {

                // Only show the environment selection orbiter if the app is actually able to
                // set the environment
                if (LocalSpatialCapabilities.current.isAppEnvironmentEnabled) {
                    EnvironmentSelectionOrbiter(
                        onClick = {
                            scope.launch {
                                currentEnvironmentOptionIndex =
                                    (currentEnvironmentOptionIndex + 1) % ENVIRONMENT_OPTIONS.size

                                session.scene.spatialEnvironment.setSpatialEnvironmentPreference(
                                    ENVIRONMENT_OPTIONS[currentEnvironmentOptionIndex].toSpatialEnvironmentPreference(
                                        session
                                    )
                                )
                            }
                        }
                    )
                }

                Scaffold(
                    topBar = { XRFundamentalsTopAppBar() }
                ) { innerPadding ->
                    Box(Modifier.padding(innerPadding)) {
                        PrimaryCard(
                            modifier = Modifier
                                .padding(16.dp)
                                .verticalScroll(rememberScrollState())
                        )
                    }
                }
            }
            SpatialPanel(
                modifier = SubspaceModifier
                    .width(340.dp)
                    .height(800.dp)
            ) {
                Surface {
                    SecondaryCardList(
                        modifier = Modifier
                            .padding(16.dp)
                            .verticalScroll(rememberScrollState())
                    )
                }
            }
        }
    }
}