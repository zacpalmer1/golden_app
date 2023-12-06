//
//  TestTabBarView.swift
//  golden
//
//  Created by Zachary Palmer on 11/2/23.
//

import SwiftUI

struct TestTabBarView: View {
    var body: some View {
        ZStack{
            TabView {
                Home()
                    .tabItem {
                        Image(systemName: "sun.max.fill")
                        
                    }
                    .tag(Tabs.favorites)
                
                Favorites()
                    .tabItem {
                        Image(systemName: "star.fill")
                        
                    }
                    .tag(Tabs.favorites)
                    
                TimerView()
                    .tabItem {
                        Rectangle()
                            .frame(width:300)
                    }
                    
                Activity()
                    .tabItem {
                        Image(systemName: "heart.fill")
                        
                    }
                    .tag(Tabs.activity)
                
                Profile()
                    .tabItem {
                        Image(systemName: "person.crop.circle.fill")
                        
                    }
                    .tag(Tabs.profile)
            }
            
            .frame(maxWidth: 370)
            .accentColor(Color.orange)
            
        }
        
    }
}

#Preview {
    TestTabBarView()
}
