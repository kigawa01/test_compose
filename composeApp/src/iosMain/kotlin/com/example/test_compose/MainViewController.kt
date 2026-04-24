package com.example.test_compose

import androidx.compose.runtime.CompositionLocalProvider
import androidx.compose.ui.window.ComposeUIViewController
import platform.UIKit.UIViewController

fun MainViewController(
    createSwiftUIView: () -> UIViewController
) = ComposeUIViewController {
    CompositionLocalProvider(LocalSwiftUIViewControllerFactory provides createSwiftUIView) {
        App()
    }
}