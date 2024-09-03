//
//  Favorites.swift
//  golden
//
//  Created by Zachary Palmer on 8/11/24.
//

import SwiftUI

struct Favorites: View {
    @State private var usersearch: String = ""
    @State private var profile = false
    @State private var isPressed = false

    var body: some View {
        ZStack {
            // Background image with dynamic opacity
            Image("image4")
                .resizable()
                .frame(width: .infinity, height: .infinity)
                .ignoresSafeArea()
                .onTapGesture {
                                   // Dismiss the keyboard when tapping outside
                                   UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                               }
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
                        Text("Search")
                            .font(.system(size: 28, weight: .heavy, design: .rounded))
                            .padding(.top, 0)
                        HStack {
                            Image(systemName: "magnifyingglass") // Use system name or custom image
                                .foregroundColor(.white)
                                .frame(height: 0)

                            TextField("Find Friends", text: $usersearch)
                                .foregroundColor(.white)
                                .frame(height: 10)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(10)
                        .padding(.bottom, 10)
                        
                        HStack(spacing: 0) { // Set spacing to 0 to remove the default spacing
                            VStack {
                                ZStack{
                                    
                                    Image("zacprofile")
                                        .resizable()
                                        .frame(width: 70, height: 70)
                                        .foregroundColor(.white)
                                    Circle()
                                        .frame(width: 18)
                                        .foregroundStyle(.ultraThinMaterial)
                                        .offset(x:25, y:-28)
                                    Circle()
                                        .frame(width: 14)
                                        .foregroundColor(Color(hex: "E85367"))
                                        .offset(x:25, y:-28)
                                }
                                Text("Zac P.")
                                    .font(.system(size: 14, weight: .regular, design: .rounded))
                                    
                            }
                            .frame(maxWidth: .infinity) // Each VStack takes up equal width

                            
                                Button(action: {
                                    profile.toggle()
                                }) {
                                    VStack {
                                        VStack{
                                        ZStack{
                                            
                                                Image("joshprofile")
                                                    .resizable()
                                                    .frame(width: 70, height: 70)
                                                    .foregroundColor(.white)
                                                Circle()
                                                    .frame(width: 18)
                                                    .foregroundStyle(.ultraThinMaterial)
                                                    .offset(x:25, y:-28)
                                                Circle()
                                                    .frame(width: 14)
                                                    .foregroundColor(Color(hex: "8F3761"))
                                                    .offset(x:25, y:-28)
                                            }
                                            Text("Josh P.")
                                                .font(.system(size: 14, weight: .regular, design: .rounded))
                                                .foregroundColor(.white)
                                        }
                                }
                                .fullScreenCover(isPresented: $profile) {
                                    OtherProfile()
                                }
                                
                                    
                            }
                            .frame(maxWidth: .infinity)

                            VStack {
                                ZStack{
                                    
                                    Image("leeprofile")
                                        .resizable()
                                        .frame(width: 70, height: 70)
                                        .foregroundColor(.white)
                                    Circle()
                                        .frame(width: 18)
                                        .foregroundStyle(.ultraThinMaterial)
                                        .offset(x:25, y:-28)
                                    Circle()
                                        .frame(width: 14)
                                        .foregroundColor(Color(hex: "FFA72B"))
                                        .offset(x:25, y:-28)
                                }
                                Text("Lee E.")
                                    .font(.system(size: 14, weight: .regular, design: .rounded))
                                    
                            }
                            .frame(maxWidth: .infinity)

                            VStack {
                                ZStack{
                                    
                                    Image("kennprofile")
                                        .resizable()
                                        .frame(width: 70, height: 70)
                                        .foregroundColor(.white)
                                    Circle()
                                        .frame(width: 18)
                                        .foregroundStyle(.ultraThinMaterial)
                                        .offset(x:25, y:-28)
                                    Circle()
                                        .frame(width: 14)
                                        .foregroundColor(Color(hex: "FF7365"))
                                        .offset(x:25, y:-28)
                                }
                                Text("Kennedy S.")
                                    .font(.system(size: 14, weight: .regular, design: .rounded))
                                    
                            }
                            .frame(maxWidth: .infinity)
                        }
                        
                        Divider()
                        
                        Text("Trending")
                            .font(.system(size: 22, weight: .heavy, design: .rounded))
                        
                        HStack {
                            Image("jackprofile")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                            
                            Text("Jack Malo")
                            Spacer()
                            Text("6k")
                        }
                        
                        HStack {
                            Image("roryprofile")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                            Text("Rory Bostwick")
                            Spacer()
                            Text("1.2k")
                        }
                        
                        HStack {
                            Image("blakeprofile")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                            Text("Blake Gillian")
                            Spacer()
                            Text("19k")
                        }
                        
                       
                        
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

#Preview {
    Favorites()
}

