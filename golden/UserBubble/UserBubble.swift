import SwiftUI

struct UserBubble: View {

    @State private var profile = false
    @State private var isPressed = false

    var body: some View {
        ZStack {

            Rectangle()
                .frame(width: .infinity, height: 52)
                .cornerRadius(35)
                .foregroundStyle(.ultraThinMaterial)

            HStack {
                 // Add Spacer to push elements to the center
                Spacer()
                Image("profile")
                    .resizable()
                    .frame(width: 35, height: 35)
                
                Button(action: {
                    profile.toggle()
                }) {
                    Text("zacpalmer1")
                        .foregroundColor(.white)
                }
                .fullScreenCover(isPresented: $profile) {
                    Profile()
                }
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Image(systemName: "sun.horizon.fill")
                    .foregroundColor(.white)
                
                Text("2")
                    .foregroundColor(.white)
                Spacer()
                Button(action: {
                    isPressed.toggle()
                }) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(isPressed ? Color.pink : Color.primary)
                }
                
                Text("3")
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "message.fill")
                    .foregroundColor(.white)
                
                Text("8")
                    .foregroundColor(.white)
                Spacer()
                
                Spacer() // Add Spacer to push elements to the center
            }
            Spacer()
            
        }
        .padding(.top, 600)
        .padding(20)
    }
}
struct HeartButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.pink : Color.primary)
            .scaleEffect(configuration.isPressed ? 1.2 : 1.0)
    }
}
