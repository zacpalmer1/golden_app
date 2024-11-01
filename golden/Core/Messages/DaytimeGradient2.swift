import SwiftUI

struct DaytimeGradient2: View {
    @State private var isAnimating = false
    var colors: [Color] // Accept an array of colors to pass to the gradient
    
    var body: some View {
        ZStack {
            if #available(iOS 18.0, *) {
                MeshGradient(
                    width: 3,
                    height: 3,
                    points: [[0.0, 0.0], [isAnimating ? 0.1 : 0.9, 0.0], [1.0, 0.0],
                             [0.0, 0.5], [0.5, isAnimating ? 1.0 : 0.1], [1.0, isAnimating ? 1.0 : 0.4],
                             [0.0, 1.0], [isAnimating ? 0.1 : 0.9, 1.0], [1.0, 1.0]],
                    colors: colors // Use the passed colors
                )
                .onAppear {
                    withAnimation(.easeInOut(duration: 10).repeatForever(autoreverses: true)) {
                        isAnimating.toggle()
                    }
                }
            } else {
                // Fallback for earlier versions of iOS
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    DaytimeGradient2(colors: [.red, .blue, .purple]) // Example usage with custom colors
}
