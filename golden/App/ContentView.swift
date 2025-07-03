//
//  ContentView.swift
//  golden
//
//  Created by Zachary Palmer on 10/24/23.
//

import SwiftUI



struct ContentView: View {
    @State var selectedTab: Tabs = .home
    @State var expand = false
    @EnvironmentObject var colorSelection: ColorSelection
    @StateObject private var viewModel = VideoViewModel()
    @Namespace var animation
    @StateObject private var scrollSyncManager = ScrollSyncManager()
    @State private var isIconColored = false
    var body: some View {
        VStack {
            ZStack {
                switch selectedTab {
                case .home:
                    
                    TopBarView(selectedTab: $selectedTab)
                        .zIndex(1)
                        .containerRelativeFrame(.vertical, alignment: .top)
                        .edgesIgnoringSafeArea(.top)
                    Home(isIconColored: $isIconColored).zIndex(0)
                        .environmentObject(colorSelection)
                        .colorScheme(.dark)
                    
                    Newtesttabbar(user: UserFeedItem(
                        image: "kennlarge",
                        name: "Kennedy", // should exist in Assets.xcassets
                        username: "hammerb12",
                        followersCount: "5",
                        streaks: "34",
                        likes: "42",
                        comments: "12",
                        date: "12",
                        favoritePosts: ["12, 12, 12"]
                        
                    ))
                    .zIndex(2)
                    
                case .favorites:
                    Favorites().zIndex(0)
                        .environmentObject(colorSelection)
                    TestTabBarView(selectedTab: $selectedTab)
                    
                case .activity:
                    Activity().zIndex(0)
                        .environmentObject(colorSelection)
                    TestTabBarView(selectedTab: $selectedTab)
                    
                case .profile:
                    Profile().zIndex(0).environmentObject(viewModel)
                        .environmentObject(colorSelection)
                    TestTabBarView(selectedTab: $selectedTab)
                    
                case .homeYesterday:
                    TopBarView(selectedTab: $selectedTab)
                        .zIndex(1)
                        .containerRelativeFrame(.vertical, alignment: .top)
                        .edgesIgnoringSafeArea(.top)
                    HomeYesterday(isIconColored: $isIconColored).zIndex(0)
                        .environmentObject(colorSelection)
                    TestTabBarView(selectedTab: $selectedTab)
                    
                    
                case .homeFeatured:
                    TopBarView(selectedTab: $selectedTab)
                        .zIndex(1)
                        .containerRelativeFrame(.vertical, alignment: .top)
                        .edgesIgnoringSafeArea(.top)
                    HomeFeatured(isIconColored: $isIconColored).zIndex(0)
                        .environmentObject(colorSelection)
                    TestTabBarView(selectedTab: $selectedTab)
                    
                }
            }
        }
    }
}

#Preview {
    Group{
        ContentView()
            .environmentObject(ColorSelection())
        
        
    }
    
}
