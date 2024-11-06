import SwiftUI
let trendingUser = [
    (image: "joshlarge", name: "Josh Powers", username: "@joshpowers", rank: "1st:"),
    (image: "kennlarge", name: "Kennedy Seigler", username: "@kennseigler", rank: "2nd:"),
    (image: "lindalarge", name: "Lindsay McNamara", username: "@lindamc",  rank: "3rd:"),
    (image: "blakelarge", name: "Blake Gillian", username: "@blakegill",  rank: "4th:"),
    (image: "zaclarge", name: "Zac Palmer", username: "@zacpalmer1", rank: "5th:")
]
let suggestedUser = [
    (image: "blakelarge", name: "Blake Gillian", username: "@blakegill"),
    (image: "kennlarge", name: "Kennedy Seigler", username: "@kennseigler"),
    (image: "zaclarge", name: "Zac Palmer", username: "@zacpalmer1"),
    (image: "joshlarge", name: "Josh Powers", username: "@joshpowers"),
    (image: "lindalarge", name: "Lindsay McNamara", username: "@lindamc")
]
struct Favorites: View {
    @State private var usersearch: String = ""
    @State private var profile = false
    @State private var isPressed = false
    @StateObject private var colorSelection = ColorSelection()
    @State private var showMeshGradient = false
    @Environment(\.colorScheme) var colorScheme
    @State private var trending = false
    @State private var suggested = false
    var body: some View {
        ZStack {
            // Background image with dynamic opacity
            
            ZStack(alignment: .top) { // Aligns content to the top
                // Ensures the rectangles extend to the edges
            
                VStack {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack{
                            Text("Search")
                                .font(.system(size: 30, weight: .heavy, design: .default))
                            Spacer()
                            Image(systemName: "line.3.horizontal.decrease.circle")
                                .resizable()
                                .foregroundStyle(.blue)
                                
                                .frame(width: 23, height: 23)
                                .padding(.trailing, 17)
                        }
                        
                        HStack {
                            Image(systemName: "magnifyingglass") // Use system name or custom image
                                .foregroundColor(.gray)
                                .frame(height: 0)

                            TextField("Find Friends & Groups", text: $usersearch)
                                .font(.system(size: 16, weight: .regular, design: .default))
                                
                                .frame(height: 35)
                        }
                        .padding(.horizontal, 7)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .padding(.bottom, 10)
                        .padding(.trailing, 17)
                        // Wrapping the below content in a ScrollView
                        ScrollView {
                            VStack(alignment: .leading, spacing: 10) {
                                Button(action: {
                                    trending.toggle()
                                }) {
                                    HStack(spacing: 0) {
                                        Text("Trending")
                                            .font(.system(size: 24, weight: .bold, design: .default))
                                            .padding(.trailing, 6)
                                            .foregroundColor(colorScheme == .dark ? .white : .black)
                                        
                                        Image(systemName: "chevron.right")
                                            .bold()
                                            .foregroundColor(.gray)
                                    }
                                    
                                }
                                .fullScreenCover(isPresented: $trending) {
                                    TrendingView()
                                }
                               
                                // Horizontal ScrollView for Suggested Users
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack{
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
                                                        .frame(width: 320, height: 210)
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
                                    .padding(.trailing, 54)
                                }
                                .scrollBounceBehavior(.basedOnSize)
                                .scrollTargetLayout()
                                .scrollTargetBehavior(.viewAligned)
                                .padding(.bottom, 10)
                                
                                Button(action: {
                                    suggested.toggle()
                                }) {
                                    HStack(spacing: 0) {
                                        HStack(spacing: 0) {
                                            Text("Suggested")
                                                .font(.system(size: 24, weight: .bold, design: .default))
                                                .padding(.trailing, 6)
                                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                            
                                            Image(systemName: "chevron.right")
                                                .bold()
                                                .foregroundColor(.gray)
                                        }
                                    }
                                    
                                }
                                .fullScreenCover(isPresented: $suggested) {
                                    SuggestedView()
                                }
                               
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 10) { // Set spacing to 0 to remove the default spacing
                                        // Suggested Users
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
                                                            .frame(width: 160, height: 160)
                                                            .foregroundColor(.white)
                                                            .cornerRadius(10)
                                                        
                                                    }
                                                }
                                                .frame(maxWidth: .infinity)
                                            }
                                            .fullScreenCover(isPresented: $profile) {
                                                ViewProfile()
                                                    .transition(.move(edge: .trailing))
                                            }
                                           
                                        }
                                    }
                                    .padding(.trailing, 45)
                                }
                                .scrollBounceBehavior(.basedOnSize)
                                .scrollTargetLayout()
                                .scrollTargetBehavior(.viewAligned)
                                .padding(.bottom, 10)
                                HStack(spacing: 0) {
                                    Text("Groups")
                                        .font(.system(size: 24, weight: .bold, design: .default))
                                        .padding(.trailing, 6)
                                        .foregroundColor(colorScheme == .dark ? .white : .black)
                                    
                                    Image(systemName: "chevron.right")
                                        .bold()
                                        .foregroundColor(.gray)
                                }
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 10) { // Set spacing to 0 to remove the default spacing
                                        // Group Cards
                                        ForEach([("card", "Charlotte, NC"), ("card2", "College of Ch.")], id: \.1) { (color, title) in
                                            VStack {
                                                ZStack(alignment: .bottomLeading) {
                                                    DaytimeGradient2(colors: color == "card" ? card : card2)
                                                        .frame(width: 160, height: 149)
                                                        .cornerRadius(10)
                                                    Text(title)
                                                        .font(.system(size: 20, weight: .bold, design: .default))
                                                        .padding(10)
                                                        .shadow(color: Color.black.opacity(0.6), radius: 4, x: 0, y: 2)
                                                }
                                            }
                                            .frame(maxWidth: .infinity)
                                        }
                                    }
                                }
                                .padding(.bottom, 100)
                               
                            }
                            
                             // Add margin on both sides, allowing for more padding
                        }
                    }
                    .padding(.leading, 17)
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
    Favorites()
}
