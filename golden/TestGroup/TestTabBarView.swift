import SwiftUI

struct TestTabBarView: View {
    @Binding var selectedTab: Tabs

    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Rectangle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.black, Color.black.opacity(0)]),
                                    startPoint: .bottom,
                                    endPoint: .top
                                )
                            )
                            .frame(width: .infinity, height: 200)

                HStack {
                    Spacer()
                    tabButton(tab: .home, imageName: "sun.max.fill")
                    Spacer()
                    tabButton(tab: .favorites, imageName: "magnifyingglass")
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
                .offset(y:50)
                
               // Spacer()
             // Rectangle()
                  //  .frame(width: .infinity, height: 100)
                   // .foregroundColor(.black)
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
                .foregroundColor(selectedTab == tab ? .white : .gray)
        }
        //.frame(maxWidth: .infinity, maxHeight: .infinity) // Ensure the button covers the entire available space
    }
}
