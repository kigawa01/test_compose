import SwiftUI

struct NativeGreetingView: View {
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "swift")
                .font(.system(size: 48))
                .foregroundColor(.orange)
            Text("Hello from SwiftUI!")
                .font(.title2)
                .fontWeight(.semibold)
            Text("This component is rendered natively by SwiftUI.")
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(radius: 4)
    }
}