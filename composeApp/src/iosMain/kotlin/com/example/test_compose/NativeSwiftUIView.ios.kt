package com.example.test_compose

import androidx.compose.runtime.Composable
import androidx.compose.runtime.compositionLocalOf
import androidx.compose.ui.Modifier
import androidx.compose.ui.viewinterop.UIKitViewController
import platform.UIKit.UIViewController

val LocalSwiftUIViewControllerFactory = compositionLocalOf<(() -> UIViewController)?> { null }

@Composable
actual fun NativeSwiftUIView(modifier: Modifier) {
    val factory = LocalSwiftUIViewControllerFactory.current ?: return
    UIKitViewController(
        factory = factory,
        modifier = modifier,
    )
}