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
    var body: some View {
        VStack {
            ZStack {
                switch selectedTab {
                case .home:
                    
                    Home().zIndex(0)
                        .environmentObject(colorSelection)
                        .colorScheme(.dark)
                    TestTabBarView(selectedTab: $selectedTab)
                    
                    TopBarView(selectedTab: $selectedTab)
                        .offset(y: -362)
                        .padding(.bottom)
                    
                    TestBubbleView(scrollSyncManager: scrollSyncManager)
                        
                    
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
                    
                    TopBarView(selectedTab: $selectedTab)
                        .offset(y: -362)
                        .padding(.bottom)
                    TestBubbleView(scrollSyncManager: scrollSyncManager)
                        
                case .homeFeatured:
                    HomeFeatured().zIndex(0)
                        .environmentObject(colorSelection)
                    TestTabBarView(selectedTab: $selectedTab)
                    
                    TopBarView(selectedTab: $selectedTab)
                        .offset(y: -362)
                        .padding(.bottom)
                    TestBubbleView(scrollSyncManager: scrollSyncManager)
                        
                }
            }
        }
    }
}

#Preview {
    
    ContentView()
            .environmentObject(ColorSelection()) 
    
}
