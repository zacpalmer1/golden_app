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
                                    Image(systemName: "chevron.backward")
                                        .resizable()
                                        .frame(width: 8, height: 14)
                                        .foregroundColor(.white)
                                        .bold()
                                        .offset(x: -1)
                                }
                            }
                                
                        }
                        .padding(.horizontal, 10)
                        .padding(.horizontal, 7)
                        
                        VStack(alignment: .center){
                            ScrollView(.vertical, showsIndicators: false) {
                                VStack(alignment: .center, spacing: 10) { // Set spacing to 0 to remove the default spacing
                                    // Suggested Users
                                    ForEach(trendingUser, id: \.name){ trendingUser in
                                        Button(action: {
                                            profile.toggle()
                                        }) {
                                            VStack(alignment:.leading){
                                                HStack{
                                                    Text(trendingUser.rank)
                                                        .font(.system(size: 20, weight: .bold, design: .default))
                                                        .foregroundColor(colorScheme == .dark ? .white : .black)
                                                    Text(trendingUser.name)
                                                        .font(.system(size: 20, weight: .regular, design: .default))
                                                        .foregroundColor(.gray)
                                                }
                                                Image(trendingUser.image)
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 360, height: 270)
                                                    .foregroundColor(.white)
                                                    .cornerRadius(10)
                                            }
                                            .frame(maxWidth: .infinity)
                                        }
                                        .fullScreenCover(isPresented: $profile) {
                                            ViewProfile()
                                                .transition(.move(edge: .trailing))
                                            
                                        }
                                    }
                                }
                               
                            }
                            .scrollBounceBehavior(.basedOnSize)
                            .scrollTargetLayout()
                            .scrollTargetBehavior(.viewAligned)
                        }
                        
                        
                    }
                    
                    
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
