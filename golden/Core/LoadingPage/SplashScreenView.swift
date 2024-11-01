import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        ZStack {
            
            
            if isActive {
                ContentView()
                    .transition(.opacity)
            } else {
                VStack {
                    Color.black.ignoresSafeArea()
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                        withAnimation(.easeIn(duration: 0.5)) {
                            self.isActive = true
                        }
                    }
                }
                .transition(.opacity)
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
