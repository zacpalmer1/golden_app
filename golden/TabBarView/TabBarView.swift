//
//  TabBarView.swift
//  golden
//
//  Created by Zachary Palmer on 10/31/23.
//

import SwiftUI

enum Tabs: Int {
    case home = 1
    case favorites = 2
    case activity = 3
    case profile = 4
}
struct TabBarView: View {
    @State private var secondsRemaining = 60 // Initial countdown time in seconds
    @Binding var selectedTabs: Tabs
    //Colors
    let darkModeBar = Color(red: 0.18, green: 0.20, blue: 0.19)
    
    var body: some View {
        VStack {
            // Your main content here
            Spacer()
            ZStack{
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 115)
                    .foregroundStyle(.clear)
                // Custom Tab Bar
                HStack {
                    Spacer()
                    Button(action: {
                        selectedTabs = .home
                    }) {
                        Image(systemName: "sun.max.fill")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .foregroundColor(.orange)
                    }
                    Spacer()
                    Button(action: {
                        selectedTabs = .favorites
                    }) {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    TimerView()
                    Spacer()
                    Button(action: {
                        selectedTabs = .activity
                    }) {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 22, height: 20)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Button(action: {
                        selectedTabs = .profile
                    }) {
                        Image("profile")
                            .resizable()
                            .frame(width: 25, height: 25)
                            //.foregroundColor(.red)
                    }
                    Spacer()
                }
                
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        
    }
    
}

