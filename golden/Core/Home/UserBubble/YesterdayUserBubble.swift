import SwiftUI


struct YesterdayTestBubbleView: View {
    @ObservedObject var scrollSyncManager: ScrollSyncManager
    @Binding var isIconColored: Bool

    // Filtered list of users with date "Yesterday"
    private var yesterdayUsers: [UserFeedItem] {
        userFeedData.filter { $0.date == "Yesterday" }
    }

    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            ScrollViewReader { proxy in
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(yesterdayUsers, id: \.name) { user in
                            UserBubble(user: user, isIconColored: $isIconColored) // Pass the entire user object
                                .frame(height: 60)
                                .containerRelativeFrame(.vertical, count: 1, spacing: 0)
                                .scrollTransition { content, phase in
                                    content
                                        .opacity(phase.isIdentity ? 1 : 0.5)
                                        .scaleEffect(x: phase.isIdentity ? 1 : 0.5, y: phase.isIdentity ? 1 : 0.5)
                                }
                                .id(user.name)
                        }
                    }
                    .padding(.horizontal)
                }
                .scrollDisabled(true)
                
                .onChange(of: scrollSyncManager.currentIndex) { newIndex in
                    // Bounds check to prevent out-of-range errors
                    if newIndex < yesterdayUsers.count {
                        withAnimation(.spring) {
                            proxy.scrollTo(yesterdayUsers[newIndex].name, anchor: .center)
                        }
                    }
                }
                // Initial scroll when view appears
                .onAppear {
                    if scrollSyncManager.currentIndex < yesterdayUsers.count {
                        withAnimation(.spring) {
                            proxy.scrollTo(yesterdayUsers[scrollSyncManager.currentIndex].name, anchor: .center)
                        }
                    }
                }
            }
            .frame(maxHeight: 60)
            .padding(.top, 620)
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
        .colorScheme(.dark)
    }
}

struct YesterdayUserBubble: View {
    @State var user: UserFeedItem
    @State private var profile = false
    @Binding var isIconColored: Bool
    var body: some View {
        Button(action: {
            profile.toggle()
        }) {
            VStack(alignment: .leading) {
                ZStack {
                    Rectangle()
                        .frame(height: 55)
                        .cornerRadius(14)
                        .foregroundStyle(.ultraThinMaterial)

                    HStack {
                        Image(user.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 40, height: 40)
                            .clipped()
                            .cornerRadius(11)

                        Text(user.name)
                            .font(.system(size: 16, weight: .regular, design: .default))
                            .lineLimit(1)
                            .foregroundColor(.white)
                        Spacer()

                        HStack(spacing: 15) {
                            HStack {
                                Image(systemName: "sun.horizon.fill")
                                    .foregroundColor(.white)
                                Text("\(user.streaks)")
                                    .font(.system(size: 15, weight: .regular, design: .rounded))
                                    .foregroundColor(.white)
                            }
                            HStack {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(isIconColored ? .pink : .white)
                                
                                Text("\(user.likes)")
                                    .font(.system(size: 15, weight: .regular, design: .rounded))
                                    .foregroundColor(.white)
                            }
                            HStack {
                                Image(systemName: "message.fill")
                                    .foregroundColor(.white)
                                Text("\(user.comments)")
                                    .font(.system(size: 15, weight: .regular, design: .rounded))
                                    .foregroundColor(.white)
                            }
                        }
                        .layoutPriority(1)
                    }
                    .padding(.horizontal, 8)
                    .padding(.trailing, 10)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .fullScreenCover(isPresented: $profile) {
            ViewProfile(user: user) // Pass the selected user object here
                .transition(.move(edge: .trailing))
        }
    }
}
