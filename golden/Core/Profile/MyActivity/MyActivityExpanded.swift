//
//  Activity.swift
//  golden
//
//  Created by Zachary Palmer on 10/25/23.
//

import SwiftUI
struct MyActivityExpanded: View {
    @State private var usersearch: String = ""
    @StateObject private var colorSelection = ColorSelection()
    @Environment(\.presentationMode) var presentationMode
    @State private var showMeshGradient = false
    var body: some View {
        NavigationStack {
            ZStack {
                // Background image with dynamic opacity
                
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
                                Text("Activity")
                                    .font(.system(size: 28, weight: .heavy, design: .default))
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
                            Text("Today")
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                                .padding(.bottom, 5)
                            
                            HStack{
                                Image("joshprofile")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .foregroundColor(.white)
                                Text("Josh Powers")
                                Image(systemName: "heart.fill")
                                    .foregroundColor(.pink)
                                Spacer()
                                Text("10:32 AM")
                            }
                            Divider()
                            VStack{
                                HStack{
                                    Image("leeprofile")
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                        .foregroundColor(.white)
                                    Text("Lee Eberly")
                                    Image(systemName: "message.fill")
                                        .foregroundColor(.green)
                                    Spacer()
                                    Text("9:23 AM")
                                    
                                }
                                VStack{
                                    Text("Wow I was just there how was it?")
                                }
                                .frame(width:350, alignment: .leading)
                            }
                            Divider()
                            VStack{
                                HStack{
                                    Image("kennprofile")
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                        .foregroundColor(.white)
                                    Text("Kennedy Siegler")
                                    Image(systemName: "hand.wave.fill")
                                        .foregroundColor(.orange)
                                    Spacer()
                                    Text("9:12 AM")
                                    
                                }
                                VStack{
                                    Text("Are you at the Panthers game, im in row 233.")
                                }
                                .frame(width:350, alignment: .leading)
                                
                            }
                            Divider()
                            HStack{
                                Image("jackprofile")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .foregroundColor(.white)
                                Text("Jack Malo")
                                Image(systemName: "heart.fill")
                                    .foregroundColor(.pink)
                                Spacer()
                                Text("7:47 AM")
                            }
                            Divider()
                            HStack{
                                Image("blakeprofile")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .foregroundColor(.white)
                                Text("Blake Gillian")
                                Image(systemName: "heart.fill")
                                    .foregroundColor(.pink)
                                Spacer()
                                Text("7:23 AM")
                            }
                            Divider()
                            VStack{
                                HStack{
                                    Image("roryprofile")
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                        .foregroundColor(.white)
                                    Text("Rory Bostwick")
                                    Image(systemName: "message.fill")
                                        .foregroundColor(.green)
                                    Spacer()
                                    Text("7:22 AM")
                                }
                                VStack{
                                    Text("Where was this taken I havent been there?")
                                }
                                .frame(width:350, alignment: .leading)
                            }
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
    MyActivityExpanded()
}
