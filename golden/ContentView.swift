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
                // Views corresponding to the selected tab
                switch selectedTab {
                case .home:
                    Home().zIndex(0)
                    
                    TopBarView()
                        .offset(y: -362)
                        .padding(.bottom)
                    UserBubble(animation: animation, expand: $expand)
                case .favorites:
                    Favorites().zIndex(0)
                    
                    TopBarView()
                        .offset(y: -362)
                        .padding(.bottom)
                    UserBubble(animation: animation, expand: $expand)
                case .activity:
                    Activity().zIndex(0)
                    
                    TopBarView()
                        .offset(y: -362)
                        .padding(.bottom)
                    UserBubble(animation: animation, expand: $expand)
                case .profile:
                    Profile().zIndex(0)
                    
                    TopBarView()
                        .offset(y: -362)
                        .padding(.bottom)
                }
                TestTabBarView(selectedTab: $selectedTab)
            }
        }
    }
}

#Preview {
    
    ContentView()
}
