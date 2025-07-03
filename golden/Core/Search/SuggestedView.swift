import SwiftUI

struct SuggestedView: View {
    @State private var profile = false
    @State private var isPressed = false
    @StateObject private var colorSelection = ColorSelection()
    @State private var showMeshGradient = false
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            // Background image with dynamic opacity
            
            ZStack(alignment: .top) { // Aligns content to the top
                // Ensures the rectangles extend to the edges
            
                VStack {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack{
                            Text("Suggested")
                                .font(.system(size: 30, weight: .heavy, design: .default))
                            Spacer()
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                ZStack {
                                    Circle()
                                        .frame(width: 30)
                                        .foregroundStyle(.ultraThinMaterial)
                                    Image(systemName: "chevron.down")
                                        .resizable()
                                        .frame(width: 14, height: 8)
                                        .foregroundColor(colorScheme == .dark ? .white : .black)
                                        .bold()
                                }
                            }
                                
                        }
                        
                        
                        VStack(alignment: .center){
                            ScrollView(.vertical, showsIndicators: false) {
                                HStack{
                                    VStack(alignment: .center, spacing: 10) {
                                        ForEach(suggestedUser, id: \.name){ suggestedUser in
                                            Button(action: {
                                                profile.toggle()
                                            }) {
                                                VStack(spacing: 0) {
                                                    VStack(alignment:.leading){
                                                        Text(suggestedUser.name)
                                                            .font(.system(size: 14, weight: .bold, design: .default))
                                                            .foregroundColor(colorScheme == .dark ? .white : .black)
                                                        Text(suggestedUser.username)
                                                            .font(.system(size: 12, weight: .regular, design: .default))
                                                            .foregroundColor(.gray)
                                                        Image(suggestedUser.image)
                                                            .resizable()
                                                            .scaledToFill()
                                                            .frame(width: 170, height: 170)
                                                            .foregroundColor(.white)
                                                            .cornerRadius(10)
                                                        
                                                    }
                                                }
                                                .padding(.bottom, 20)
                                                .frame(maxWidth: .infinity)
                                            }
                                            .fullScreenCover(isPresented: $profile) {
                                                ViewProfile(user: UserFeedItem(image: "joshlarge", name: "Josh Powers",  username:"joshpowers", followersCount: "98", streaks: "5", likes: "2", comments: "2", date:"Today",favoritePosts: ["joshpost1", "joshpost2", "joshpost3", "joshpost4", "joshpost5", "joshpost6"]))

                                                    .transition(.move(edge: .trailing))
                                                
                                            }
                                        }
                                    }
                                    VStack(alignment: .center, spacing: 10) {
                                        ForEach(suggestedUser, id: \.name){ suggestedUser in
                                            Button(action: {
                                                profile.toggle()
                                            }) {
                                                VStack(spacing: 0) {
                                                    VStack(alignment:.leading){
                                                        Text(suggestedUser.name)
                                                            .font(.system(size: 14, weight: .bold, design: .default))
                                                            .foregroundColor(colorScheme == .dark ? .white : .black)
                                                        Text(suggestedUser.username)
                                                            .font(.system(size: 12, weight: .regular, design: .default))
                                                            .foregroundColor(.gray)
                                                        Image(suggestedUser.image)
                                                            .resizable()
                                                            .scaledToFill()
                                                            .frame(width: 170, height: 170)
                                                            .foregroundColor(.white)
                                                            .cornerRadius(10)
                                                        
                                                    }
                                                }
                                                .padding(.bottom, 20)
                                                .frame(maxWidth: .infinity)
                                            }
                                            .fullScreenCover(isPresented: $profile) {
                                                ViewProfile(user: UserFeedItem(image: "joshlarge", name: "Josh Powers", username:"joshpowers", followersCount: "98", streaks: "5", likes: "2", comments: "2", date:"Today",favoritePosts: ["joshpost1", "joshpost2", "joshpost3", "joshpost4", "joshpost5", "joshpost6"]))

                                                    .transition(.move(edge: .trailing))
                                                
                                            }
                                        }
                                    }
                                }
                            }
                            .scrollBounceBehavior(.basedOnSize)
                            .scrollTargetLayout()
                            .scrollTargetBehavior(.viewAligned)
                        }
                        
                        
                    }
                    
                    .padding(.horizontal, 17)
                    .padding(.top, 10)
                    .frame(maxWidth: .infinity) // Allow VStack to take up available width
                }
                .frame(maxWidth: .infinity)
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    SuggestedView()
}
