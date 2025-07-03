import SwiftUI

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func roundedCorner(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct Favorites: View {
    @State private var usersearch: String = ""
    @FocusState private var isSearchFocused: Bool  // Track focus on the search bar
    @State private var profile = false
    @State private var isPressed = false
    @StateObject private var colorSelection = ColorSelection()
    @State private var showMeshGradient = false
    @Environment(\.colorScheme) var colorScheme
    @State private var trending = false
    @State private var suggested = false
    
    var body: some View {
        
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                
                HStack {
                    Text("Search")
                        .font(.system(size: 30, weight: .heavy, design: .rounded))
                    Spacer()
                    if isSearchFocused {
                        Button("Cancel") {
                            isSearchFocused = false  // Unfocus the textfield when cancel is tapped
                            usersearch = ""  // Clear the search text
                        }
                        .foregroundColor(.blue)
                        .padding(.trailing, 17)
                        .frame(width: 70)  // Set a fixed width for the cancel button
                    }else{
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .resizable()
                            .foregroundStyle(.blue)
                            .frame(width: 23, height: 23)
                            .padding(.trailing, 17)
                    }
                }
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    // TextField that shrinks when focused
                    TextField("Find Friends & Groups", text: $usersearch)
                        .font(.system(size: 16, weight: .regular, design: .default))
                        .frame(height: 35)
                        .focused($isSearchFocused)  // Bind the focus state
                    // Adjust the width when focused
                        .animation(.easeInOut(duration: 0.3), value: isSearchFocused)  // Animate the width change
                    
                    
                    // "Cancel" button that takes up the space next to the TextField
                    
                }
                
                .padding(.horizontal, 7)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.bottom, 10)
                .padding(.trailing, 17)
                if isSearchFocused {
                    ScrollView {
                        VStack(alignment: .leading) {
                            HStack{
                                Text("Recent")
                                    .font(.system(size: 18, weight: .bold, design: .default))
                                Spacer()
                                Text("See all")
                                    .font(.system(size: 16, weight: .regular, design: .default))
                                    .foregroundColor(.blue)
                            }
                            .padding(.bottom, 10)
                            .padding(.trailing, 17)
                            ForEach(userFeedData, id: \.name) { user in
                                SearchableItem(user: user)
                            }
                        }
                        .transition(.opacity) // Apply fade transition
                        .animation(.easeInOut(duration: 0.3), value: isSearchFocused) // Animate fade-in
                    }
                } else {
                    SearchCover()
                        .transition(.opacity)
                        .animation(.easeInOut(duration: 2.3), value: isSearchFocused)
                }
            }
            .padding(.leading, 19)
            .padding(.top, 6)
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity)
        .scrollIndicators(.hidden)
    }
    
}
struct SearchableItem : View{
    @State var user: UserFeedItem
    var body: some View{
        
        HStack{
            Image(user.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipped()
                .cornerRadius(11)
            VStack(alignment: .leading){
                Text(user.name)
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .lineLimit(1)
                
                Text("@\(user.username)")
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
            Spacer()
            // Image(systemName: "person.fill")
            //.foregroundColor(.gray)
            // Text("\(user.followersCount)")
            //.font(.system(size: 15, weight: .regular, design: .default))
            Image(systemName: "minus")
                .foregroundColor(.gray)
        }
        .padding(.trailing, 17)
        Divider()
            .padding(.bottom, 5)
            .padding(.trailing, 17)
    }
    
}
#Preview {
    Favorites()
}
