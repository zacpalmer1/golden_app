//
//  CreateAccount.swift
//  golden
//
//  Created by Zachary Palmer on 8/11/24.
//
import SwiftUI

struct LogIn: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @StateObject private var colorSelection = ColorSelection()
    @State private var showMeshGradient = false
    var body: some View {
        NavigationStack {
            
            ZStack(alignment: .top) {
                
                // Background image with dynamic opacity
                MessagesGradient(colorSelection: colorSelection, show: showMeshGradient)
                
                ZStack { // Aligns content to the top
                    
                    
                    // Foreground content centered both horizontally and vertically
                    VStack {
                        Spacer() // Pushes content towards the center vertically
                        
                        VStack(spacing: 20) {
                            Text("Golden")
                                .font(.system(size: 38, weight: .heavy, design: .rounded))
                                .padding()
                            
                            TextField("Username", text: $username)
                                .padding()
                                .foregroundColor(.white)
                                .frame(width: 330, height: 45)
                                .background(Color.gray.opacity(0.4))
                                .cornerRadius(10)
                            
                            SecureField("Password", text: $password) // Use SecureField for password input
                                .padding()
                                .frame(width: 330, height: 45)
                                .background(Color.gray.opacity(0.4))
                                .cornerRadius(10)
                            
                            Button(action: {
                                print("Button tapped!")
                            }) {
                                Text("Log In")
                                    .frame(width: 330, height: 50)
                                    .background(Color.orange)
                                    .foregroundColor(.white)
                                    .cornerRadius(30)
                            }
                            
                            NavigationLink(destination: SignUp1().navigationBarBackButtonHidden(true)) {
                                Text("Don't have an account?")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14))
                                Text("Sign up")
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.system(size: 14))
                            }
                            
                            NavigationLink(destination: ContentView().navigationBarBackButtonHidden()) {
                                Text("Skip Sign up")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14))
                            }
                            
                        }
                        .frame(maxWidth: .infinity) // Make sure the inner VStack takes up all available horizontal space
                        .padding(.bottom, 20) // Add some padding to the bottom to prevent it from being too close to the edge
                        
                        Spacer() // Pushes content towards the center vertically
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                }
            }
        }
    }
}
#Preview {
    LogIn()
}
