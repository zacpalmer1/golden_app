import SwiftUI

struct UserBubble: View {
    @State private var profile = false
    @State private var isPressed = false
    @State var rotation: CGFloat = 0.0

    var userName: String
    var profileImage: String
    var streaks: String
    var likes: String
    var comments: String
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .frame(height: 55)
                    .cornerRadius(14)
                    .foregroundStyle(.ultraThinMaterial)
                    

                HStack {
                    Image(profileImage)
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
                            .frame(width: geometry.size.width * 0.30, alignment: .leading) // Dynamically sized based on screen width
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
                        Text(streaks)
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
                            Text(likes)
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular, design: .rounded))
                        }
                    }
                    
                    Spacer()
                    Spacer()
                    HStack(spacing: 4) {
                        Image(systemName: "message.fill")
                            .foregroundColor(.white)
                        Text(comments)
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
    @ObservedObject var scrollSyncManager: ScrollSyncManager
    var userNames = ["Josh Powers", "Zac Palmer", "Kennedy Seigler", "Lindsay McNamara", "Blake Gillian"]
    var profileImage = ["joshlarge", "zaclarge", "kennlarge", "lindalarge", "blakelarge"]
    var streaks = ["5", "3", "4", "5", "2"]
    var likes = ["41", "16", "23", "74", "84"]
    var comments = ["3", "2", "8", "2", "5"]
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            ScrollViewReader { proxy in
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(userNames.indices, id: \.self) { index in
                            UserBubble(userName: userNames[index], profileImage: profileImage[index], streaks: streaks[index], likes: likes[index], comments: comments[index])
                                .frame(height: 60)
                        }
                    }
                    .padding(.horizontal) // Adjust the ScrollView padding as needed
                }
            }
            .scrollTargetLayout()
            
                .offset(x: scrollSyncManager.scrollOffset)
                .frame(maxHeight: 70) // Allow ScrollView to take available height
                .scrollTargetBehavior(.paging)
                .padding(.top, 620)
                Spacer()
            
        }
        .edgesIgnoringSafeArea(.all)
        .colorScheme(.dark)
    }
}




