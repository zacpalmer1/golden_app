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
                        .frame(width: .infinity, height: 200)
                    
                    Rectangle()
                        .frame(width: .infinity, height: 650)
                        .foregroundColor(.black)
                }
                VStack{
                    Text("Golden")
                        .font(.system(size: 28, weight: .heavy, design: .rounded))
                        .padding()
                    
                    TextField("Username", text: $username)
                        .padding()
                        .foregroundColor(.white)
                        .frame(width: 300,height: 50) // Set the height of the text box
                        .background(Color.gray.opacity(0.4)) // Light gray background
                        .cornerRadius(10) // Rounded corners
                    
                    TextField("Password", text: $password)
                        .padding()
                        .frame(width: 300,height: 50) // Set the height of the text box
                        .background(Color.gray.opacity(0.4)) // Light gray background
                        .cornerRadius(10) // Rounded corners
                        .padding()
                    Button(action: {
                        print("Button tapped!")
                        // Add your action here
                    }) {
                        Text("Log In")
                            .frame(width: 300, height: 50) // Set the button's frame size
                            .background(Color.orange) // Set the button's background color
                            .foregroundColor(.white) // Set the text color
                            .cornerRadius(30) // Round the corners
                    }
                    
                    .padding(.bottom)
                    Button(action: {
                        
                    }) {
                        Text("Dont have and account?")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                        Text("Sign up")
                            .foregroundColor(.white)
                            .bold()
                            .font(.system(size: 14))
                        
                    }
                    
                }
            }
        }
    }
}
#Preview {
    LogIn()
}
