//
//  Newtesttabbar.swift
//  golden
//
//  Created by Zachary Palmer on 7/2/25.
//

import SwiftUI

struct Newtesttabbar: View {
    @State private var isIconColored = false
    @State var user: UserFeedItem
    @State private var search: String = ""
    init(user: UserFeedItem) {
        _user = State(initialValue: user)
        UITabBar.appearance().tintColor = UIColor.orange
    }

    var body: some View {
        TabView {
            Home(isIconColored: $isIconColored)
                .tabItem {
                    Label("Home", systemImage: "sun.max.fill")
                }

            Activity()
                .tabItem {
                    Label("Connect", systemImage: "hand.wave.fill")
                }

            Profile()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }


            Favorites()
                .tabItem {
                    Label("", systemImage: "magnifyingglass")
            }
        }
        .accentColor(.white)
        .searchable(text: $search)
        .tabBarMinimizeBehavior(.onScrollDown)
        
        .tabViewBottomAccessory {
            HStack {
                Button(action: {
                    // Action to add an exercise
                }) {
                    HStack(spacing: 0) {
                        Image(user.image) // Assumes user.image is a valid asset name
                            .resizable()
                            .frame(width: 34, height: 34)
                            .cornerRadius(5)
                        Spacer()
                        
                            Text(user.name)
                                .fontWeight(.semibold)
                            Spacer()
                        Spacer()
                            HStack(spacing: 8) {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(isIconColored ? .pink : .white)
                                    .foregroundColor(.white)
                                Text(user.likes)
                                Image(systemName: "message.fill")
                                    .foregroundColor(isIconColored ? .pink : .white)
                                    .foregroundColor(.white)
                                Text(user.comments)
                                Image(systemName: "sun.horizon.fill")
                                    .foregroundColor(isIconColored ? .pink : .white)
                                    .foregroundColor(.white)
                                Text(user.streaks)
                            }
                            .font(.caption)
                       
                    }
                    
                    
                    .frame(maxWidth: .infinity)
                    
                    .cornerRadius(10)
                }
            }
            .padding(.horizontal) // Optional: adds padding to edges
        }
    }
}
#Preview {
    Newtesttabbar(user: UserFeedItem(
        image: "kennlarge",
        name: "Kennedy S.", // should exist in Assets.xcassets
        username: "hammerb12",
        followersCount: "5",
        streaks: "34",
        likes: "42",
        comments: "12",
        date: "12",
        favoritePosts: ["12, 12, 12"]
        
    ))
}
