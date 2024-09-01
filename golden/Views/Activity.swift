//
//  Activity.swift
//  golden
//
//  Created by Zachary Palmer on 10/25/23.
//

import SwiftUI

struct Activity: View {
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
                   
                    Text("Activity")
                        .font(.system(size: 31, weight: .heavy, design: .rounded))
                    Text("Likes")
                        .font(.system(size: 22, weight: .heavy, design: .rounded))
                    
                    HStack {
                        Image("profile")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                        Text("Josh Powers")
                        Spacer()
                        Text("8:23 AM")
                    }
                    
                    HStack {
                        Image("profile")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                        Text("Davis Cooney")
                        Spacer()
                        Text("1:17 AM")
                    }
                    
                    HStack {
                        Image("profile")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                        Text("Lee Eberly")
                        Spacer()
                        Text("10:21 PM")
                    }
                    
                    Divider()
                        .frame(width: 350)
                    
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
                        Text("I was their l...")
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
    Activity()
}
