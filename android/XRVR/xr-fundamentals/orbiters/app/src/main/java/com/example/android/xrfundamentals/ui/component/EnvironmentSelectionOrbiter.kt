package com.example.android.xrfundamentals.ui.component

import androidx.compose.foundation.shape.CornerSize
import androidx.compose.material3.FilledTonalIconButton
import androidx.compose.material3.Icon
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.unit.dp
import androidx.xr.compose.spatial.EdgeOffset
import androidx.xr.compose.spatial.Orbiter
import androidx.xr.compose.spatial.OrbiterEdge
import androidx.xr.compose.subspace.layout.SpatialRoundedCornerShape
import com.example.android.xrfundamentals.R

@Composable
fun EnvironmentSelectionOrbiter(
    modifier: Modifier = Modifier,
    onClick: () -> Unit = {},
) {
    Orbiter(
        position = OrbiterEdge.Top,
        alignment = Alignment.Start,
        offset = EdgeOffset.inner(16.dp),
        shape = SpatialRoundedCornerShape(
            CornerSize(100)
        )
    ) {
        FilledTonalIconButton(
            modifier = modifier,
            onClick = onClick,
        ) {
            Icon(painterResource(R.drawable.ic_launcher_foreground), "Show environment selection dialog")
        }
    }
}
