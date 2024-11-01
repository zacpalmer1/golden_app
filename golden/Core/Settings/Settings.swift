//
//  Activity.swift
//  golden
//
//  Created by Zachary Palmer on 10/25/23.
//

import SwiftUI
struct Settings: View {
    @State private var usersearch: String = ""
    @StateObject private var colorSelection = ColorSelection()
    @Environment(\.presentationMode) var presentationMode
    @State private var settingsPrivacy = false
    @State private var settingsBlocked = false
    @State private var settingsNotifications = false
    @State private var showMeshGradient = false
    var body: some View {
        NavigationStack {
            ZStack {
                
                
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
                                Text("Settings")
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
                            Text("Your Account")
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                                .padding(.bottom, 5)
                            Button(action: {
                                settingsPrivacy.toggle()
                            }) {
                                HStack{
                                    Image(systemName:"lock.fill")
                                        .foregroundColor(.white)
                                    Text("Account Privacy")
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text("Public")
                                        .foregroundColor(.gray)
                                    Image(systemName: "chevron.right")
                                        .bold()
                                        .foregroundColor(.gray)
                                }
                            }
                            .fullScreenCover(isPresented: $settingsPrivacy) {
                                SettingsPrivacy()
                            }
                           
                            Divider()
                            Button(action: {
                                settingsBlocked.toggle()
                            }) {
                                HStack{
                                    Image(systemName:"person.slash.fill")
                                        .bold()
                                        .foregroundColor(.white)
                                    Text("Blocked Accounts")
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text("3")
                                        .foregroundColor(.gray)
                                    Image(systemName: "chevron.right")
                                        .bold()
                                        .foregroundColor(.gray)
                                }
                            }
                            .fullScreenCover(isPresented: $settingsBlocked) {
                                SettingsBlocked()
                            }
                            
                            Divider()
                            Button(action: {
                                settingsNotifications.toggle()
                            }) {
                                HStack{
                                    Image(systemName:"bell.fill")
                                        .foregroundColor(.white)
                                    Text("Notifications")
                                        .foregroundColor(.white)
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .bold()
                                        .foregroundColor(.gray)
                                }
                            }
                            .fullScreenCover(isPresented: $settingsNotifications) {
                                SettingsNotifications()
                            }
                            
                            Divider()
                            HStack{
                                Image(systemName:"lifepreserver")
                                    .bold()
                                Text("Help")
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .bold()
                                    .foregroundColor(.gray)
                            }
                            Divider()
                            HStack{
                                Image(systemName:"info.circle.fill")
                                    .bold()
                                Text("About")
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .bold()
                                    .foregroundColor(.gray)
                            }
                            Divider()
                            HStack{
                                Image(systemName:"person.fill")
                                    .bold()
                                Text("Log Out")
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .bold()
                                    .foregroundColor(.gray)
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
    Settings()
}
