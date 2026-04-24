import UIKit
import SwiftUI
import ComposeApp

struct ComposeView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        MainViewControllerKt.MainViewController {
            UIHostingController(rootView: NativeGreetingView())
        }
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ComposeView()
                .ignoresSafeArea(.keyboard)
                .navigationTitle("My App")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}