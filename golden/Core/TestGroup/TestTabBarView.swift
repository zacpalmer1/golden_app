import SwiftUI

struct TestTabBarView: View {
    @Binding var selectedTab: Tabs
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            ZStack {
                // Fixed height for background to prevent shifting
                VStack(spacing: 0) {
                    ZStack {
                        if selectedTab == .home {
                            // Background for home view with a larger height
                            LinearGradient(
                                gradient: Gradient(colors: [Color.black.opacity(1.0), Color.clear]),
                                startPoint: .bottom,
                                endPoint: .top
                            )
                            .frame(height: 180)
                            .offset(y: -40)
                        } else {
                            // Default background with blur for other tabs
                            Blur(style: colorScheme == .dark ? .dark : .systemChromeMaterial)
                                .frame(height: 90) // Match home view height to avoid shifting
                            
                        }
                    }
                }
                .frame(height: 180) // Fixed frame height for background ZStack

                // Main button rectangle with a material background
                ZStack {
                    // HStack for tab buttons
                    HStack {
                        Spacer()
                        tabButton(tab: .home, imageName: "sun.max.fill")
                        Spacer()
                        tabButton(tab: .favorites, imageName: "magnifyingglass")
                        Spacer()
                        TestView() // Adjust if needed
                            .onLongPressGesture(minimumDuration: 1.0) {
                                TestView()
                            }
                        Spacer()
                        tabButton(tab: .activity, imageName: "hand.wave.fill")
                        Spacer()
                        tabButton(tab: .profile, imageName: "person.fill")
                        Spacer()
                    }
                }
                .offset(y: -15)
            }
            .frame(height: 90) // Adjust frame height of entire ZStack for consistent tab item placement
        }
        .edgesIgnoringSafeArea(.all)
    }

    private func tabButton(tab: Tabs, imageName: String) -> some View {
        Button(action: {
            selectedTab = tab
        }) {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 22, height: 22)
                .padding(.vertical, 20) // Increase the tappable area without changing icon size
                .background(Color.clear) // Ensure padding is not visible
                .foregroundColor((selectedTab == tab) ? (colorScheme == .dark ? .white : .gray) : .gray)
        }
    }
}

// Sample view for TestView to make preview work
