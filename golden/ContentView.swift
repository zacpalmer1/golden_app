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
    @Namespace var animation
    var body: some View {
        VStack {
            
            ZStack {
                switch selectedTab {
                case .home:
                    Home().zIndex(0)
                    TestTabBarView(selectedTab: $selectedTab)
                    UserBubble()
                    TopBarView(selectedTab: $selectedTab)
                        .offset(y: -362)
                        .padding(.bottom)
                    
                case .favorites:
                    Favorites().zIndex(0)
                    TestTabBarView(selectedTab: $selectedTab)

                case .activity:
                    Activity().zIndex(0)
                    TestTabBarView(selectedTab: $selectedTab)
                    
                case .profile:
                    Profile().zIndex(0)
                    TestTabBarView(selectedTab: $selectedTab)
                    
                case .homeYesterday:
                    HomeYesterday().zIndex(0)
                    TestTabBarView(selectedTab: $selectedTab)
                    UserBubble()
                    TopBarView(selectedTab: $selectedTab)
                        .offset(y: -362)
                        .padding(.bottom)
                    
                case .homeFeatured:
                    HomeFeatured().zIndex(0)
                    TestTabBarView(selectedTab: $selectedTab)
                    UserBubble()
                    TopBarView(selectedTab: $selectedTab)
                        .offset(y: -362)
                        .padding(.bottom)
                }
            }
        }
    }
}

#Preview {
    
    ContentView()
}
