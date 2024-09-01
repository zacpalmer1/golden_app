//
//  Activity.swift
//  golden
//
//  Created by Zachary Palmer on 10/25/23.
//

import SwiftUI
struct Activity: View {
    @State private var usersearch: String = ""
    var body: some View {
        ZStack {
            // Background image with dynamic opacity
            Image("image3")
                .resizable()
                .frame(width: .infinity, height: .infinity)
            
                .ignoresSafeArea()
            
            Rectangle()
                .foregroundStyle(.ultraThinMaterial)
                .ignoresSafeArea()
            
            ZStack {
                VStack(spacing: 0) {
                    Rectangle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.black, Color.clear]), // Gradient from black to clear
                                startPoint: .bottom, // Gradient starts at the bottom
                                endPoint: .top // Gradient ends at the top
                            )
                        )
                    
                    Rectangle()
                        .frame(width: .infinity, height: .infinity)
                        .foregroundColor(.black)
                }
                .padding(.top, 190)
                .ignoresSafeArea()
                
                VStack { // Outer VStack
                    VStack(alignment: .leading, spacing: 16) { // Inner VStack
                        
                        Text("Activity")
                            .font(.system(size: 28, weight: .heavy, design: .rounded))
                        
                        // Centered Streak Section
                        HStack {
                            Spacer() // Push content to the center
                            VStack(alignment: .center) {
                                Text("12")
                                    .font(.system(size: 38, weight: .heavy, design: .rounded))
                                Text("Streak")
                                    .font(.system(size: 28, weight: .heavy, design: .rounded))
                            }
                            Spacer() // Push content to the center
                        }
                        
                        Text("Likes")
                            .font(.system(size: 22, weight: .heavy, design: .rounded))
                        
                        HStack {
                            Image("profile")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                            Text("Josh Powers")
                            Spacer()
                            Text("10:32 AM")
                        }
                        
                        HStack {
                            Image("profile")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                            Text("Davis Cooney")
                            Spacer()
                            Text("7:04 AM")
                        }
                        
                        HStack {
                            Image("profile")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                            Text("Lee Eberly")
                            Spacer()
                            Text("11:43 PM")
                        }
                        HStack {
                            Image("profile")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                            Text("Spencer Marchant")
                            Spacer()
                            Text("11:43 PM")
                        }
                        Divider()
                        
                        Text("Comments")
                            .font(.system(size: 22, weight: .heavy, design: .rounded))
                        
                        HStack {
                            Image("profile")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                            
                            Text("Jack Malo")
                            Spacer()
                            Text("Wow this looks...")
                        }
                        
                        HStack {
                            Image("profile")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                            Text("Kanye West")
                            Spacer()
                            Text("Find God")
                        }
                        
                        HStack {
                            Image("profile")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                            Text("Emma Chamberland")
                            Spacer()
                            Text("I was here y...")
                        }
                        HStack {
                            Image("profile")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                            Text("Rory Bostwick")
                            Spacer()
                            Text("That was so...")
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 10)
                    .frame(maxWidth: .infinity) // Allow VStack to take up available width
                }
                .padding(.horizontal, 25) // Add margin on both sides, allowing for more padding
            }
        }
    }
}

#Preview {
    Activity()
}
