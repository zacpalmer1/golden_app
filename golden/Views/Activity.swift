//
//  Activity.swift
//  golden
//
//  Created by Zachary Palmer on 10/25/23.
//

import SwiftUI
struct Activity: View {
    @State private var usersearch: String = ""
    @State private var isShowingFullScreen = false
    var body: some View {
        NavigationStack {
            ZStack {
                // Background image with dynamic opacity
                Image("image3")
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
                            Text("Messages")
                                .font(.system(size: 28, weight: .heavy, design: .rounded))
                                .padding(.top, 0)
                            HStack {
                                Image(systemName: "magnifyingglass") // Use system name or custom image
                                    .foregroundColor(.white)
                                    .frame(height: 0)
                                
                                TextField("Find Messages", text: $usersearch)
                                    .foregroundColor(.white)
                                    .frame(height: 10)
                            }
                            .padding()
                            .background(Color.gray.opacity(0.4))
                            .cornerRadius(10)
                            .padding(.bottom, 10)
                            
                            HStack(spacing: 0) { // Set spacing to 0 to remove the default spacing
                                VStack(spacing:10) {
                                    
                                    HStack{
                                        ZStack{
                                            Image("zacprofile")
                                                .resizable()
                                                .frame(width: 50, height: 50)
                                                .foregroundColor(.white)
                                            Circle()
                                                .frame(width: 18)
                                                .foregroundStyle(.ultraThinMaterial)
                                                .offset(x:18, y:-20)
                                            Circle()
                                                .frame(width: 14)
                                                .foregroundColor(Color(hex: "FF7365"))
                                                .offset(x:18, y:-20)
                                        }
                                        VStack{
                                            HStack{
                                                Text("Zac Palmer")
                                                    .font(.system(size: 18, weight: .bold, design: .rounded))
                                                Spacer()
                                                Text("7:30 PM")
                                                    .font(.system(size: 14, weight: .regular, design: .rounded))
                                            }
                                            Text("When are are doing our Fantasy draft today? Im ready")
                                                .font(.system(size: 14, weight: .regular, design: .rounded))
                                        }
                                    }
                                    Divider()
                                    NavigationLink(destination: Messages()) {
                                        HStack{
                                            ZStack{
                                                Image("joshprofile")
                                                    .resizable()
                                                    .frame(width: 50, height: 50)
                                                    .foregroundColor(.white)
                                                Circle()
                                                    .frame(width: 18)
                                                    .foregroundStyle(.ultraThinMaterial)
                                                    .offset(x:18, y:-20)
                                                Circle()
                                                    .frame(width: 14)
                                                    .foregroundColor(Color(hex: "8F3761"))
                                                    .offset(x:18, y:-20)
                                            }
                                            VStack(alignment:.leading){
                                                HStack{
                                                    Text("Josh Powers")
                                                        .font(.system(size: 18, weight: .bold, design: .rounded))
                                                        .foregroundColor(.white)
                                                    Spacer()
                                                    Text("6:12 PM")
                                                        .font(.system(size: 14, weight: .regular, design: .rounded))
                                                        .foregroundColor(.white)
                                                }
                                                
                                                Text("Did you end up going to class?")
                                                    .font(.system(size: 14, weight: .bold, design: .rounded))
                                                    .foregroundColor(.white)
                                                
                                            }
                                            
                                        }
                                    }
                                  
                                    
                                    Divider()
                                    HStack{
                                        ZStack{
                                            Image("leeprofile")
                                                .resizable()
                                                .frame(width: 50, height: 50)
                                                .foregroundColor(.white)
                                            Circle()
                                                .frame(width: 18)
                                                .foregroundStyle(.ultraThinMaterial)
                                                .offset(x:18, y:-20)
                                            Circle()
                                                .frame(width: 14)
                                                .foregroundColor(Color(hex: "FFA72B"))
                                                .offset(x:18, y:-20)
                                        }
                                        VStack(alignment:.leading){
                                            HStack{
                                                Text("Lee Eberly")
                                                    .font(.system(size: 18, weight: .bold, design: .rounded))
                                                Spacer()
                                                Text("4:36 PM")
                                                    .font(.system(size: 14, weight: .regular, design: .rounded))
                                            }
                                            Text("What time are we meeting up for the game tonight? I’m pumped!")
                                                .font(.system(size: 14, weight: .bold, design: .rounded))
                                        }
                                    }
                                    Divider()
                                    HStack{
                                        ZStack{
                                            Image("blakeprofile")
                                                .resizable()
                                                .frame(width: 50, height: 50)
                                                .foregroundColor(.white)
                                            Circle()
                                                .frame(width: 18)
                                                .foregroundStyle(.ultraThinMaterial)
                                                .offset(x:18, y:-20)
                                            Circle()
                                                .frame(width: 14)
                                                .foregroundColor(Color(hex: "BB4564"))
                                                .offset(x:18, y:-20)
                                        }
                                        VStack(alignment:.leading){
                                            HStack{
                                                Text("Blake Gillian")
                                                    .font(.system(size: 18, weight: .bold, design: .rounded))
                                                Spacer()
                                                Text("2:13 PM")
                                                    .font(.system(size: 14, weight: .regular, design: .rounded))
                                            }
                                            Text("Are we starting the project today? I’m good to go.")
                                                .font(.system(size: 14, weight: .regular, design: .rounded))
                                        }
                                    }
                                    Divider()
                                    HStack{
                                        ZStack{
                                            Image("kennprofile")
                                                .resizable()
                                                .frame(width: 50, height: 50)
                                                .foregroundColor(.white)
                                            Circle()
                                                .frame(width: 18)
                                                .foregroundStyle(.ultraThinMaterial)
                                                .offset(x:18, y:-20)
                                            Circle()
                                                .frame(width: 14)
                                                .foregroundColor(Color(hex: "8F3761"))
                                                .offset(x:18, y:-20)
                                        }
                                        VStack(alignment:.leading){
                                            HStack{
                                                Text("Kennedy Siegler")
                                                    .font(.system(size: 18, weight: .bold, design: .rounded))
                                                Spacer()
                                                Text("12:33 PM")
                                                    .font(.system(size: 14, weight: .regular, design: .rounded))
                                            }
                                            Text("When are we having our team meeting? I’m ready to contribute.")
                                                .font(.system(size: 14, weight: .regular, design: .rounded))
                                        }
                                        
                                    }
                                    
                                    Divider()
                                    HStack{
                                        ZStack{
                                            Image("jackprofile")
                                                .resizable()
                                                .frame(width: 50, height: 50)
                                                .foregroundColor(.white)
                                            Circle()
                                                .frame(width: 18)
                                                .foregroundStyle(.ultraThinMaterial)
                                                .offset(x:18, y:-20)
                                            Circle()
                                                .frame(width: 14)
                                                .foregroundColor(Color(hex: "FF8D48"))
                                                .offset(x:18, y:-20)
                                        }
                                        VStack(alignment:.leading){
                                            HStack{
                                                Text("Jack Malo")
                                                    .font(.system(size: 18, weight: .bold, design: .rounded))
                                                Spacer()
                                                Text("8:11 AM")
                                                    .font(.system(size: 14, weight: .regular, design: .rounded))
                                            }
                                            Text("Are we grabbing lunch before the big meeting? I’m starving.")
                                                .font(.system(size: 14, weight: .regular, design: .rounded))
                                        }
                                        
                                    }
                                    
                                }
                                
                                .frame(maxWidth: .infinity) // Each VStack takes up equal width
                                
                                
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
}

#Preview {
    Activity()
}
