//
//  SearchCover.swift
//  golden
//
//  Created by Zachary Palmer on 11/12/24.
//

import SwiftUI

struct SearchCover: View {
    @State private var usersearch: String = ""
    @State private var profile = false
    @State private var isPressed = false
    @StateObject private var colorSelection = ColorSelection()
    @State private var showMeshGradient = false
    @Environment(\.colorScheme) var colorScheme
    @State private var trending = false
    @State private var suggested = false
    
    var body: some View {
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
                                ViewProfile(user: UserFeedItem(image: "joshlarge", name: "Josh Powers", username:"joshpowers", followersCount: "98", streaks: "5", likes: "2", comments: "2", date:"Today",favoritePosts: ["joshpost1", "joshpost2", "joshpost3", "joshpost4", "joshpost5", "joshpost6"]))

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
                                ViewProfile(user: UserFeedItem(image: "joshlarge", name: "Josh Powers", username:"joshpowers", followersCount: "98", streaks: "5", likes: "2", comments: "2", date:"Today",favoritePosts: ["joshpost1", "joshpost2", "joshpost3", "joshpost4", "joshpost5", "joshpost6"]))

                                    .transition(.move(edge: .trailing))
                            }
                           
                        }
                    }
                    .padding(.trailing, 45)
                }
                //.scrollBounceBehavior(.basedOnSize)
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
                        ForEach(GroupFeedData, id: \.name) { group in
                            GroupSelection(group: group)
                                .id(group.name)
                        }
                    }
                    .padding(.trailing, 200)
                }
                .scrollBounceBehavior(.basedOnSize)
                .scrollTargetLayout()
                .scrollTargetBehavior(.viewAligned)
                .padding(.bottom, 100)
                
               
            }
            
             // Add margin on both sides, allowing for more padding
        }
    }
}

struct GroupSelection: View {
    @State var group: GroupData
    @State private var profile = false
    
    var body: some View {
        Button(action: {
            profile.toggle()
        }) {
            VStack {
                ZStack{
                    ZStack(alignment: .bottomLeading) {
                        Image(group.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 210, height: 250)
                            .cornerRadius(15)
                        Rectangle()
                            .frame(height: 55)
                            .foregroundStyle(.ultraThinMaterial)
                            .roundedCorner(15, corners: [.bottomLeft, .bottomRight])
                        Text(group.name)
                            .font(.system(size: 20, weight: .regular, design: .default))
                            .foregroundColor(.white)
                            .padding(10)
                        
                    }
                    
                }
            }
            .frame(maxWidth: .infinity)
        }
        
    }
}

#Preview{
    SearchCover()
}
