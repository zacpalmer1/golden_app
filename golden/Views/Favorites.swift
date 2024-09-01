//
//  Favorites.swift
//  golden
//
//  Created by Zachary Palmer on 8/11/24.
//

import SwiftUI

struct Favorites: View {
    @State private var usersearch: String = ""
    var body: some View {
        ZStack {
            // Background image with dynamic opacity
            
            Image("image4")
                .resizable()
                .frame(width: .infinity, height: .infinity)
            
                .ignoresSafeArea()
            
            Rectangle()
                .foregroundStyle(.ultraThinMaterial)
                .ignoresSafeArea()
            
            
            ZStack{
                VStack(spacing: 0){
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
                .padding(.top,190)
                .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 16) { // Adjust spacing as needed
                    Text("Search")
                        .font(.system(size: 31, weight: .heavy, design: .rounded))
                    TextField("Find Friends", text: $usersearch)
                        .padding()
                        .foregroundColor(.white)
                        .frame(width: 350, height: 40) // Set the height of the text box
                        .background(Color.gray.opacity(0.4)) // Light gray background
                        .cornerRadius(10) // Rounded corners
                    
                    Text("Suggested")
                        .font(.system(size: 22, weight: .heavy, design: .rounded))
                    
                    HStack {
                        Image("profile")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                        Text("Josh Powers")
                        Spacer()
                        Text("34")
                    }
                    
                    HStack {
                        Image("profile")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                        Text("Davis Cooney")
                        Spacer()
                        Text("13")
                    }
                    
                    HStack {
                        Image("profile")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                        Text("Lee Eberly")
                        Spacer()
                        Text("21")
                    }
                    
                    Divider()
                        .frame(width: 350)
                    
                    Text("Trending")
                        .font(.system(size: 22, weight: .heavy, design: .rounded))
                    
                    
                    
                    HStack {
                        
                        Image("profile")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                        
                        Text("Jack Malo")
                        Spacer()
                        Text("6")
                    }
                    
                    HStack {
                        Image("profile")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                        Text("Kanye West")
                        Spacer()
                        Text("1.2k")
                    }
                    
                    HStack {
                        Image("profile")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                        Text("Emma Chamberland")
                        Spacer()
                        Text("19k")
                    }
                    
                    // The Spacer pushes the VStack content to the top of the screen
                    Spacer()
                }
                .frame(maxWidth: 350, maxHeight: .infinity)
                .padding(.top, 20)
                    
                
                
              
            }
            
            
        }
        
    }
}

#Preview {
    Favorites()
}
