import SwiftUI

struct UserBubble: View {
    @State private var profile = false
    @State private var isPressed = false
    @State var rotation: CGFloat = 0.0

    var userName: String

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .frame(height: 55)
                    .cornerRadius(14)
                    .foregroundStyle(.ultraThinMaterial)
                    

                HStack {
                    Image("joshlarge")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .clipped()
                        .cornerRadius(11)
                    
                    Button(action: {
                        profile.toggle()
                    }) {
                        Text(userName)
                            .foregroundColor(.white)
                            .frame(width: geometry.size.width * 0.35, alignment: .leading) // Dynamically sized based on screen width
                            .font(.system(size: 16, weight: .regular, design: .default))
                    }
                    .fullScreenCover(isPresented: $profile) {
                        ViewProfile()
                            .transition(.move(edge: .trailing))
                    }

                    Spacer()

                    HStack(spacing: 4) {
                        Image(systemName: "sun.horizon.fill")
                            .foregroundColor(.white)
                        Text("12")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular, design: .rounded))
                    }
                    
                    Spacer()
                    Spacer()
                    Button(action: {
                        isPressed.toggle()
                    }) {
                        HStack(spacing: 4) {
                            Image(systemName: "heart.fill")
                                .foregroundColor(isPressed ? Color.pink : Color.primary)
                            Text("3")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular, design: .rounded))
                        }
                    }
                    
                    Spacer()
                    Spacer()
                    HStack(spacing: 4) {
                        Image(systemName: "message.fill")
                            .foregroundColor(.white)
                        Text("8")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular, design: .rounded))
                            .padding(.trailing, 15)
                    }
                }
                .padding(.horizontal, geometry.size.width * 0.02) // Dynamic padding
            }
        }
        .colorScheme(.dark)
        .frame(height: 60) // Consistent height across devices
        .padding(.top, 10)
    }
}

struct TestBubbleView: View {
    var userNames = ["Josh Powers", "Alice Smith", "Bob Johnson", "Sara Lee", "Tom Brown"]

    var body: some View {
        VStack {
            Spacer()

            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 10) {
                    ForEach(userNames.indices, id: \.self) { index in
                        UserBubble(userName: userNames[index])
                            .frame(height: 60)
                    }
                }
                .padding(.horizontal) // Adjust the ScrollView padding as needed
            }
            .frame(maxHeight: 70) // Allow ScrollView to take available height
            .scrollTargetBehavior(.paging)
            .padding(.top, 630)
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
        .colorScheme(.dark)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TestBubbleView()
        
    }
}
