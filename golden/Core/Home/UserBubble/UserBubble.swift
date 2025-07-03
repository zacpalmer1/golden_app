import SwiftUI

struct TestBubbleView: View {
    @ObservedObject var scrollSyncManager: ScrollSyncManager
    @Binding var isIconColored: Bool
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            ScrollViewReader { proxy in
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(userFeedData, id: \.name) { user in
                            UserBubble(user: user, isIconColored: $isIconColored) // Pass the entire user object
                                .frame(height: 60)
                                .containerRelativeFrame(.vertical, count: 1, spacing: 0)
                                                                    
                                .scrollTransition { content, phase in content
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
                    withAnimation(.spring) {
                        proxy.scrollTo(userFeedData[newIndex].name, anchor: .center)
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

struct UserBubble: View {
    @State var user: UserFeedItem
    @State private var profile = false
    @Binding var isIconColored: Bool
    var body: some View {
        
        Button(action: {
            profile.toggle()
        }) {
            VStack(alignment: .leading) {
                ZStack {
                    if #available(iOS 26.0, *) {
                                   RoundedRectangle(cornerRadius: 34, style: .continuous)
                                       .fill(.clear)
                                       .frame( height: 50)
                                       .glassEffect( in: RoundedRectangle(cornerRadius: 34), isEnabled: true)
                                       .padding()
                               } else {
                                   RoundedRectangle(cornerRadius: 34, style: .continuous)
                                       .fill(.ultraThinMaterial)
                                       .frame(height: 45)
                                       .padding()
                               }

                       // .shadow(color: .black.opacity(0.4), radius: 3)
                    HStack {
                        
                        Image(user.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 30, height: 30)
                            .clipped()
                            .cornerRadius(9)

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
                                    .font(.system(size: 15, weight: .regular, design: .default))
                                    .foregroundColor(.white)
                            }
                            HStack {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(isIconColored ? .pink : .white)
                                    .foregroundColor(.white)
                                
                                Text("\(user.likes)")
                                    .font(.system(size: 15, weight: .regular, design: .default))
                                    .foregroundColor(.white)
                            }
                            HStack {
                                Image(systemName: "message.fill")
                                    .foregroundColor(.white)
                                Text("\(user.comments)")
                                    .font(.system(size: 15, weight: .regular, design: .default))
                                    .foregroundColor(.white)
                            }
                        }
                        .layoutPriority(1)
                    }
                    .padding(.horizontal, 28)
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
