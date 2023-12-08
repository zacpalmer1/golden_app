import SwiftUI

struct TestTabBarView: View {
    @Binding var selectedTab: Tabs

    var body: some View {
        VStack {
            Spacer()
            ZStack {
              

                HStack {
                    Spacer()
                    tabButton(tab: .home, imageName: "sun.max.fill")
                    Spacer()
                    tabButton(tab: .favorites, imageName: "star.fill")
                    Spacer()
                    TimerView()
                        .onLongPressGesture(minimumDuration: 1.0) {
                            TimerSplash()
                        }
                    Spacer()
                    tabButton(tab: .activity, imageName: "hand.wave.fill")
                    Spacer()
                    tabButton(tab: .profile, imageName: "person.fill")
                    Spacer()
                }
                
                .padding(.bottom, 40)
               // Spacer()
                    
            }
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
                .foregroundColor(selectedTab == tab ? .orange : .gray)
        }
        //.frame(maxWidth: .infinity, maxHeight: .infinity) // Ensure the button covers the entire available space
    }
}
