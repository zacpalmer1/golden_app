//
//  ModalGroupView.swift
//  golden
//
//  Created by Zachary Palmer on 8/11/24.
//

import SwiftUI

struct ModalGroupView: View {
    @State private var groupsearch: String = ""
    var body: some View {
        ZStack {
            // Background image with dynamic opacity
            
            Image("image2")
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
                        .frame(width: .infinity, height: 200)
                    
                    Rectangle()
                        .frame(width: .infinity, height: 650)
                        .foregroundColor(.black)
                }
                .padding(.top,190)
                Rectangle()
                    .frame(width: 35, height:7)
                    .cornerRadius(20)
                    .padding(.bottom, 700)
                    .foregroundStyle(.gray)
                VStack(alignment: .leading) {
                    
                    TextField("Search Groups", text: $groupsearch)
                        .padding()
                        .foregroundColor(.white)
                        .frame(width: 350, height: 40) // Set the height of the text box
                        .background(Color.gray.opacity(0.4)) // Light gray background
                        .cornerRadius(10) // Rounded corners
                        .padding(.top)
                        .padding(.bottom)
                        .padding(.top, 180)
                    Text("Favorites")
                        .font(.system(size: 18, weight: .heavy, design: .rounded))
                    HStack{
                        
                        ZStack{
                            Circle()
                                .frame(width: 40)
                                .foregroundStyle(.thinMaterial)
                            Image(systemName: "person.2.fill")
                                .resizable()
                                .frame(width: 20, height: 15)
                                .foregroundColor(.white)
                        }
                        Text("Friends")
                        Spacer()
                        Text("304")
                    }
                    HStack{
                        ZStack{
                            Circle()
                                .frame(width: 40)
                                .foregroundStyle(.thinMaterial)
                            Image(systemName: "globe")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                        }
                        Text("EST - Time Zome")
                        Spacer()
                        Text("2.3M")
                    }
                    HStack{
                        ZStack{
                            Circle()
                            
                                .frame(width: 40)
                                .foregroundStyle(.thinMaterial)
                            Image(systemName: "globe.americas.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                        }
                        Text("World")
                        Spacer()
                        Text("21M")
                            
                    }
                    Divider()
                        .frame(width:350)
                        .padding(.top,10)
                        .padding(.bottom, 10)
                    Text("My Groups")
                        .font(.system(size: 18, weight: .heavy, design: .rounded))
                    HStack{
                        ZStack{
                            Circle()
                            
                                .frame(width: 40)
                                .foregroundStyle(.thinMaterial)
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.white)
                        }
                        Text("New Group")
                    }
                    HStack {
                        Image(systemName: "star")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.white)
                        ZStack {
                            Circle()
                                .frame(width: 40)
                                .foregroundStyle(.thinMaterial)
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.white)
                        }
                        
                        Text("ManBuns")
                        
                        Spacer() // This spacer pushes "1.2k" to the right
                        
                        Text("6")
                    }
                    HStack {
                        Image(systemName: "star")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.white)
                        ZStack {
                            Circle()
                                .frame(width: 40)
                                .foregroundStyle(.thinMaterial)
                            Image(systemName: "graduationcap")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                        }
                        
                        Text("College of Charleston")
                        
                        Spacer() // This spacer pushes "1.2k" to the right
                        
                        Text("1.2k")
                    }
                    HStack {
                        Image(systemName: "star")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.white)
                        ZStack {
                            Circle()
                                .frame(width: 40)
                                .foregroundStyle(.thinMaterial)
                            Image(systemName: "building.columns.fill")
                                .resizable()
                                .frame(width: 18, height: 15)
                                .foregroundColor(.white)
                        }
                        
                        Text("Charlotte")
                        
                        Spacer() // This spacer pushes "1.2k" to the right
                        
                        Text("19k")
                    }
                    
                    Spacer()
                    
                }
                .frame(width: 350)
            }
        }
    }
}

#Preview {
    ModalGroupView()
}
