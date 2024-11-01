//
//  Activity.swift
//  golden
//
//  Created by Zachary Palmer on 10/25/23.
//

import SwiftUI
struct SettingsBlocked: View {
    @State private var usersearch: String = ""
    @StateObject private var colorSelection = ColorSelection()
    @Environment(\.presentationMode) var presentationMode
    @State private var privateAccount = false
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
                                Text("Blocked Accounts")
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
                                    Image(systemName: "figure.walk.motion.trianglebadge.exclamationmark")
                                        .resizable()
                                        .frame(width: 95, height: 80)
                                    
                                }
                                Spacer()
                            }
                            .padding(.top, 15)
                            Divider()
                            HStack{
                                Text("Block User")
                                    .font(.system(size: 18, weight: .bold, design: .rounded))
                                Spacer()
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .frame(width:20, height: 20)
                                
                            }
                            .frame(height: 35)
                            Divider()
                            
                            
                            HStack {
                                Image("jackprofile")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.white)
                                
                                Text("Jack Malo")
                                Spacer()
                                ZStack{
                                    Rectangle()
                                        .frame(width:100, height:30)
                                        .foregroundColor(.red)
                                        .cornerRadius(10)
                                    Text("Unblock")
                                        .font(.system(size: 16, weight: .bold, design: .rounded))
                                        .foregroundColor(.white)
                                }
                            }
                            Divider()
                            HStack {
                                Image("roryprofile")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.white)
                                Text("Rory Bostwick")
                                Spacer()
                                ZStack{
                                    Rectangle()
                                        .frame(width:100, height:30)
                                        .foregroundColor(.red)
                                        .cornerRadius(10)
                                    Text("Unblock")
                                        .font(.system(size: 16, weight: .bold, design: .rounded))
                                        .foregroundColor(.white)
                                }
                            }
                            Divider()
                            HStack {
                                Image("blakeprofile")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.white)
                                Text("Blake Gillian")
                                Spacer()
                                ZStack{
                                    Rectangle()
                                        .frame(width:100, height:30)
                                        .foregroundColor(.red)
                                        .cornerRadius(10)
                                    Text("Unblock")
                                        .font(.system(size: 16, weight: .bold, design: .rounded))
                                        .foregroundColor(.white)
                                }
                            }
                            Divider()
                           
                            Text("Blocked users will not be able to access your profile. Any posts you make will not be visible anywhere of Golden to these users. That includes Groups, Messages, or Search. Users will not be notified that they are blocked.")
                                .font(.system(size: 14, weight: .regular, design: .rounded))
                            Divider()
                        
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
    SettingsBlocked()
}
