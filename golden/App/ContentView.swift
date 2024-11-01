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
    var body: some View {
        VStack {
            ZStack {
                switch selectedTab {
                case .home:
                    
                    Home().zIndex(0)
                        .environmentObject(colorSelection)
                    
                    TestTabBarView(selectedTab: $selectedTab)
                    
                    TopBarView(selectedTab: $selectedTab)
                        .offset(y: -362)
                        .padding(.bottom)
                    
                    TestBubbleView()
                        .padding(.bottom, 30)
                    
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
                    HomeYesterday().zIndex(0)
                        .environmentObject(colorSelection)
                    TestTabBarView(selectedTab: $selectedTab)
                    UserBubble(userName: "Josh Powers") 
                    TopBarView(selectedTab: $selectedTab)
                        .offset(y: -362)
                        .padding(.bottom)
                    
                case .homeFeatured:
                    HomeFeatured().zIndex(0)
                        .environmentObject(colorSelection)
                    TestTabBarView(selectedTab: $selectedTab)
                    UserBubble(userName: "Josh Powers") 
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
            .environmentObject(ColorSelection()) 
    
}
