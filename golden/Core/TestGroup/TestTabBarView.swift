import SwiftUI

struct TestTabBarView: View {
    @Binding var selectedTab: Tabs
    
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            ZStack {
                // Fixed height for background to prevent shifting

                // Main button rectangle with a material background
                ZStack {
                    HStack(spacing:0){
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        ZStack{
                            if #available(iOS 26.0, *) {
                                           RoundedRectangle(cornerRadius: 54, style: .continuous)
                                               .fill(.clear)
                                               .frame(width: 300, height: 60)
                                               .glassEffect( in: RoundedRectangle(cornerRadius: 44), isEnabled: true)
                                               
                                       } else {
                                           RoundedRectangle(cornerRadius: 34, style: .continuous)
                                               .fill(.ultraThinMaterial)
                                               .frame(height: 45)
                                               
                                       }
                            HStack{
                                Spacer()
                                tabButton(tab: .home, imageName: "sun.max.fill")
                                Spacer()
                                tabButton(tab: .activity, imageName: "hand.wave.fill")
                                Spacer()
                                tabButton(tab: .profile, imageName: "person.fill")
                                Spacer()
                                Text("12:34")
                                    .font(.system(size: 23, weight: .heavy, design: .rounded))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                        }
                        Spacer()
                        ZStack{
                            
                            if #available(iOS 26.0, *) {
                                           RoundedRectangle(cornerRadius: 54, style: .continuous)
                                               .fill(.clear)
                                               .frame(width: 55, height: 55)
                                               .glassEffect( in: RoundedRectangle(cornerRadius: 44), isEnabled: true)
                                               
                                       } else {
                                           RoundedRectangle(cornerRadius: 34, style: .continuous)
                                               .fill(.ultraThinMaterial)
                                               .frame(height: 45)
                                               
                                       }
                            tabButton(tab: .favorites, imageName: "magnifyingglass")
                        }
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                }
                .offset(y: -10)
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
                .foregroundColor(.white)

     }
    }
}

// Sample view for TestView to make preview work
