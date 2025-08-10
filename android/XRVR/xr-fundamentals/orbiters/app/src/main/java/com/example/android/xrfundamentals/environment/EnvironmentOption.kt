package com.example.android.xrfundamentals.environment

import androidx.xr.runtime.Session
import androidx.xr.scenecore.ExrImage
import androidx.xr.scenecore.GltfModel
import androidx.xr.scenecore.SpatialEnvironment.SpatialEnvironmentPreference
import kotlinx.coroutines.guava.await

data class EnvironmentOption(val name: String, val skyboxPath: String?, val geometryPath: String?) {
    suspend fun toSpatialEnvironmentPreference(session: Session): SpatialEnvironmentPreference? {
        if (skyboxPath == null && geometryPath == null) {
            return null
        } else {
            val skybox = skyboxPath?.let {
                ExrImage.create(session, it).await()
            }

            val geometry = geometryPath?.let {
                GltfModel.create(session, it).await()
            }

            return SpatialEnvironmentPreference(skybox, geometry)
        }
    }
}

val ENVIRONMENT_OPTIONS = listOf(
    EnvironmentOption("Default", null, null),
    EnvironmentOption("Green Hills", null, "green_hills_ktx2_mipmap.glb")
)