//
//  Profile.swift
//  golden
//
//  Created by Zachary Palmer on 10/25/23.
//

import SwiftUI

struct OtherProfile: View {
    @State private var usersearch: String = ""
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var colorSelection = ColorSelection()
    @State private var showMeshGradient = false
    let labels = ["Charleston", "New York", "Lexington", "Charlotte", "Greenville"]
    @State var rotation: CGFloat = 0.0
    var body: some View {
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
                
                ScrollView{
                    GeometryReader { geometry in
                        let offset = geometry.frame(in: .global).minY
                        let scale = offset > 0 ? 1 + min(offset / 500, 1) : 1
                        ZStack{
                            VStack {
                                
                                VStack(alignment: .leading, spacing: 16) {
                                    
                                    HStack(spacing: 0) { // Set spacing to 0 to remove the default spacing
                                        VStack(alignment:.leading) {
                                            HStack{
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
                                                .padding(.horizontal, 25)
                                                Spacer()
                                                Spacer()
                                                Text("@joshpowers1")
                                                    .font(.system(size: 16, weight: .regular, design: .rounded))
                                                    .padding(.bottom, 5)
                                                    .foregroundColor(.white)
                                                Spacer()
                                                Spacer()
                                                ZStack{
                                                    Circle()
                                                        .frame(width:35)
                                                        .foregroundStyle(.ultraThinMaterial)
                                                    Image(systemName: "gear")
                                                        .foregroundColor(.white)
                                                    
                                                }
                                                .padding(.horizontal, 25)
                                                
                                                Spacer()
                                                
                                            }
                                            .padding(.bottom, 10)
                                            ZStack{
                                                
                                                HStack{
                                                    VStack(alignment: .leading){
                                                        Text("Josh Powers")
                                                            .font(.system(size: 24, weight: .heavy, design: .rounded))
                                                            .foregroundColor(.white)
                                                            .padding(.bottom, 1)
                                                        Text("Charleston, SC")
                                                            .font(.system(size: 14, weight: .regular, design: .rounded))
                                                            .padding(.bottom, 1)
                                                            .foregroundColor(.white)
                                                        HStack{
                                                            Text("Following:")
                                                                .font(.system(size: 14, weight: .regular, design: .rounded))
                                                                .foregroundColor(.white)
                                                                .padding(.bottom, 1)
                                                            Text("102")
                                                                .font(.system(size: 14, weight: .regular, design: .rounded))
                                                                .foregroundColor(.white)
                                                            
                                                        }
                                                        HStack{
                                                            Text("Followers:")
                                                                .font(.system(size: 14, weight: .regular, design: .rounded))
                                                                .foregroundColor(.white)
                                                            Text("156")
                                                                .font(.system(size: 14, weight: .regular, design: .rounded))
                                                                .foregroundColor(.white)
                                                        }
                                                        .padding(.bottom, 10)
                                                    }
                                                    Spacer()
                                                    Image("joshprofile")
                                                        .resizable()
                                                        .frame(width: 100, height: 100)
                                                        .foregroundColor(.white)
                                                    
                                                }
                                                .padding(.horizontal, 25)
                                                .padding(.vertical, 10)
                                            }
                                            
                                            
                                            
                                            
                                            
                                            
                                        }
                                        .frame(maxWidth: .infinity) // Each VStack takes up equal width
                                        
                                    }
                                    
                                    Divider()
                                        .padding(.horizontal, 25)
                                    
                                    VStack(alignment:.leading){
                                        HStack{
                                            Text("Recents")
                                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                                .padding(.trailing, 6)
                                                .foregroundColor(.white)
                                            Text("Folders")
                                                .font(.system(size: 18, weight: .regular, design: .rounded))
                                                .padding(.trailing, 6)
                                                .foregroundColor(.white)
                                            Text("Favorites")
                                                .font(.system(size: 18, weight: .regular, design: .rounded))
                                                .padding(.trailing, 6)
                                                .foregroundColor(.white)
                                        }
                                        .padding(.horizontal, 25)
                                        ProfileCalendar() // Allow VStack to take up available width
                                        // Add margin on both sides, allowing for more padding
                                        //VStack(alignment: .leading){
                                        
                                        //  MovingRectanglesView()
                                        //    .padding(.top,30)
                                        //}
                                    }
                                    .offset(y: 0)
                                }
                                
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                }
                .scrollIndicators(.hidden)
                
            }
        }
    }
}

#Preview {
    OtherProfile()
}
