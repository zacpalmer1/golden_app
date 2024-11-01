//
//  Activity.swift
//  golden
//
//  Created by Zachary Palmer on 10/25/23.
//

import SwiftUI
struct SettingsNotifications: View {
    @State private var usersearch: String = ""
    @StateObject private var colorSelection = ColorSelection()
    @Environment(\.presentationMode) var presentationMode
    @State private var pause = false
    @State private var off = false
    @State private var sleep = false
    @State private var hour = false
    @State private var notificationEffect = false
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
                                Text("Notifications")
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
                                    Image(systemName: "bell.and.waves.left.and.right")
                                        .resizable()
                                        .frame(width: 110, height: 65)
                                        .symbolEffect(notificationEffect ? .bounce.down.byLayer : .bounce.up.byLayer, value: notificationEffect)
                                }
                                Spacer()
                            }
                            .padding(.top, 15)
                           
                            Divider()
                            HStack{
                                Text("Pause all notifications")
                                    .font(.system(size: 13, weight: .bold, design: .rounded))
                                Spacer()
                                Toggle(isOn: $notificationEffect) {
                                                
                                            }
                                
                            }
                            .frame(height: 35)
                            Divider()
                            
                            HStack{
                                Text("Turn off notifications")
                                    .font(.system(size: 13, weight: .bold, design: .rounded))
                                Spacer()
                                Toggle(isOn: $off) {
                                                
                                            }
                                
                            }
                            .frame(height: 35)
                            Divider()
                            
                            HStack{
                                Text("Sleep mode")
                                    .font(.system(size: 13, weight: .bold, design: .rounded))
                                Spacer()
                                Toggle(isOn: $sleep) {
                                                
                                            }
                                
                            }
                            .frame(height: 35)
                            Divider()
                            
                            HStack{
                                Text("Notify 1hr before sunset")
                                    .font(.system(size: 13, weight: .bold, design: .rounded))
                                Spacer()
                                Toggle(isOn: $hour) {
                                                
                                            }
                                
                            }
                            .frame(height: 35)
                            Divider()
                            
                            
                            Text("Notifications include sunset start and end times, weather alerts, messages, likes, and comments. Individual notifications cannot be turned off as these settings affect all notifications.")
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
    SettingsNotifications()
}
