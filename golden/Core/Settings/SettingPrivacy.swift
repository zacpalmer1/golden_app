//
//  Activity.swift
//  golden
//
//  Created by Zachary Palmer on 10/25/23.
//

import SwiftUI
struct SettingsPrivacy: View {
    @State private var usersearch: String = ""
    @StateObject private var colorSelection = ColorSelection()
    @Environment(\.presentationMode) var presentationMode
    @State private var privateAccount = false
    @State private var privateAcctivated = false
    @State private var showMeshGradient = false
    var body: some View {
        NavigationStack {
            ZStack {
                // Background image with dynamic opacity
                MessagesGradient(colorSelection: colorSelection, show: showMeshGradient)
                Rectangle()
                    .foregroundStyle(.ultraThinMaterial)
                    .ignoresSafeArea()
                
                ZStack(alignment: .top) { // Aligns content to the top
                    VStack(spacing: 0) {
                        Rectangle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.black, Color.clear]),
                                    startPoint: .bottom,
                                    endPoint: .top
                                )
                            )
                            .frame(height: .infinity) // Set height for the gradient Rectangle
                        
                        Rectangle()
                            .frame(height: 350) // Set height for the black Rectangle
                            .foregroundColor(.black)
                    }
                    .ignoresSafeArea() // Ensures the rectangles extend to the edges
                    
                    
                    VStack {
                        
                        VStack(alignment: .leading, spacing: 16) {
                            HStack{
                                Text("Account Privacy")
                                    .font(.system(size: 28, weight: .heavy, design: .rounded))
                                    .padding(.top, 0)
                                Spacer()
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }) {
                                    ZStack {
                                        Circle()
                                            .frame(width: 35)
                                            .foregroundStyle(.ultraThinMaterial)
                                        Image(systemName: "x.circle")
                                            
                                            .foregroundColor(.white)
                                            
                                    }
                                }
                            }
                            HStack{
                                Spacer()
                                VStack{
                                    Image(systemName: "lock.circle.dotted")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .symbolEffect(privateAccount ? .bounce.down.byLayer : .bounce.up.byLayer, value: privateAccount)
                                    Text("@zacpalmer1")
                                        .font(.system(size: 16, weight: .bold, design: .rounded))
                                        .padding(.top, 5)
                                        .padding(.bottom, 5)
                                }
                                Spacer()
                            }
                            .padding(.top, 15)
                            Divider()
                            HStack{
                                Text("Private account")
                                    .font(.system(size: 18, weight: .bold, design: .rounded))
                                Spacer()
                                Toggle(isOn: $privateAccount) {
                                                
                                            }
                                
                            }
                            Divider()
                            Text("When your account is public, your profile can be seen by any active users of Golden. ")
                                .font(.system(size: 14, weight: .regular, design: .rounded))
                                .padding(.bottom, 5)
                            Text("When your account is private, only the followers you approve can see what you share, including your photos, videos, locations, as well as the those you are following and are following you. Certain info such as you profile picture, username, number of followers and following and groups you have joined are visible to everyone on golden.")
                                .font(.system(size: 14, weight: .regular, design: .rounded))
                        }
                        .padding(.top, 10)
                        .frame(maxWidth: .infinity) // Allow VStack to take up available width
                        .padding(.horizontal, 25) // Add margin on both sides, allowing for more padding
                        
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
    }
}

#Preview {
    SettingsPrivacy()
}
