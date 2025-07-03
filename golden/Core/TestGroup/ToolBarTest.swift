import SwiftUI

struct TestSearchView: View {
    @State private var searchText = ""
    @State private var viewModel: [UserFeedItem] = userFeedData
    @FocusState private var isSearchFocused: Bool  // Track the focus state of the search bar

    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .fill(Color.blue)
                    .containerRelativeFrame([.horizontal, .vertical], {length, axis in
                        if axis == .vertical {
                            return length / 20
                        }
                        else{
                            return length
                        }
                    })
                NavigationStack {
                    VStack {
                        
                        
                        // 1. Show `SearchCover` when search is not focused and text is empty
                        if !isSearchFocused && searchText.isEmpty {
                            SearchCover()
                                .padding(.top, 10)
                                .padding(.leading, 17)
                        }
                        // 2. Show all users when search is focused but text is empty
                        else if isSearchFocused && searchText.isEmpty {
                            List(viewModel) { user in
                                UserRow(user: user)
                            }
                            .listStyle(PlainListStyle())
                        }
                        // 3. Show filtered users when search has text
                        else {
                            List(filteredUsers) { user in
                                UserRow(user: user)
                            }
                            .listStyle(PlainListStyle())
                        }
                    }
                    
                    .searchable(text: $searchText, prompt: "Find Friends & Groups")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Search")
                                .font(.system(size: 34, weight: .bold))
                                
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .animation(nil, value: isSearchFocused)
                }
            }
            .padding(.top, 8)
        }
    }

    // MARK: - Filtered Users
    var filteredUsers: [UserFeedItem] {
        if searchText.isEmpty {
            return viewModel
        } else {
            return viewModel.filter {
                $0.name.localizedCaseInsensitiveContains(searchText) ||
                $0.username.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}

// MARK: - UserRow View
struct UserRow: View {
    var user: UserFeedItem

    var body: some View {
        HStack {
            Image(user.image)
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.headline)
                Text("@\(user.username)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

// MARK: - Preview
#Preview {
    TestSearchView()
}
