/*
 * Copyright 2024 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.example.android.xrfundamentals.ui.layout

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.android.xrfundamentals.ui.component.PrimaryCard
import com.example.android.xrfundamentals.ui.component.SecondaryCardList
import com.example.android.xrfundamentals.ui.theme.XRFundamentalsTheme

@Composable
fun CompactLayout(
    modifier: Modifier = Modifier,
    primaryContent: @Composable () -> Unit,
    secondaryContent: @Composable () -> Unit
) {
    Column(
        modifier = modifier
            .padding(16.dp)
            .verticalScroll(rememberScrollState())
    ) {
        primaryContent()
        Spacer(modifier = Modifier.height(16.dp))
        secondaryContent()
    }
}

@Preview
@Composable
fun CompactLayoutPreview() {
    XRFundamentalsTheme {
        CompactLayout(
            primaryContent = {
                PrimaryCard()
            },
            secondaryContent = {
                SecondaryCardList()
            }
        )
    }
}