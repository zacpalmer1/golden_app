//
//  Activity.swift
//  golden
//
//  Created by Zachary Palmer on 10/25/23.
//

import SwiftUI
struct Messages: View {
    @State private var usersearch: String = ""
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var colorSelection = ColorSelection()
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
                    
                    ZStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "chevron.backward")
                                .font(.system(size: 17, weight: .heavy, design: .rounded))
                                .foregroundColor(.white)
                        }
                        .offset(x:-170)
                        
                        VStack(alignment:.center){
                            HStack(spacing: 10) {
                                Image("joshprofile")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                VStack(alignment: .leading) {
                                    Text("Josh Powers")
                                        .font(.system(size: 17, weight: .heavy, design: .rounded))
                                    Text("@joshpowers1")
                                        .font(.system(size: 15, weight: .regular, design: .rounded))
                                }
                            }
                        }
                        
                        
                        .navigationBarBackButtonHidden(true)
                    }
                    
                }
                VStack{
                    Spacer()
                    HStack {
                        
                        
                        TextField("Message ...", text: $usersearch)
                            .foregroundColor(.white)
                            .frame(width:320,height: 10)
                            
                    }
                    .padding()
                    
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(20)
                    .padding(.bottom, 10)
                }
                .padding(.bottom, 70)
            }
        }
    }
}

#Preview {
    Messages()
}
