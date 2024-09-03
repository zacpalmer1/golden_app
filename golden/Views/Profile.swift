//
//  Profile.swift
//  golden
//
//  Created by Zachary Palmer on 10/25/23.
//

import SwiftUI

struct Profile: View {
    @State private var usersearch: String = ""
    
    var body: some View {
        ZStack {
            // Background image with dynamic opacity
            Image("image")
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
                
                ScrollView{
                    VStack {
                        
                        VStack(alignment: .leading, spacing: 16) {
                            
                            HStack(spacing: 0) { // Set spacing to 0 to remove the default spacing
                                VStack {
                                    
                                    HStack{
                                        Spacer()
                                        ZStack{
                                            Circle()
                                                .frame(width:35)
                                                .foregroundStyle(.ultraThinMaterial)
                                            Image(systemName: "plus.circle")
                                                
                                                .foregroundColor(.white)
                                                
                                        }
                                        Spacer()
                                        ZStack{
                                            
                                            Image("zacprofile")
                                                .resizable()
                                                .frame(width: 100, height: 100)
                                                .foregroundColor(.white)
                                            Circle()
                                                .frame(width: 26)
                                                .foregroundStyle(.ultraThinMaterial)
                                                .offset(x:35, y:-38)
                                            Circle()
                                                .frame(width: 22)
                                                .foregroundColor(Color(hex: "8F3761"))
                                                .offset(x:35, y:-38)
                                        }
                                        Spacer()
                                        ZStack{
                                            Circle()
                                                .frame(width:35)
                                                .foregroundStyle(.ultraThinMaterial)
                                            Image(systemName: "gear")
                                                .foregroundColor(.white)
                                        }
                                        Spacer()
                                    }
                                    
                                    Text("Zac Palmer")
                                        .font(.system(size: 18, weight: .heavy, design: .rounded))
                                    Text("@zacpalmer1")
                                        .font(.system(size: 16, weight: .regular, design: .rounded))
                                        .padding(.bottom, 10)
                                    HStack{
                                        
                                        Text("Posts:")
                                            .font(.system(size: 18, weight: .heavy, design: .rounded))
                                        Text("122")
                                            .font(.system(size: 18, weight: .regular, design: .rounded))
                                        Spacer()
                                        Text("Streak:")
                                            .font(.system(size: 18, weight: .heavy, design: .rounded))
                                        Text("12")
                                            .font(.system(size: 18, weight: .regular, design: .rounded))
                                        Spacer()
                                        Text("Friends:")
                                            .font(.system(size: 18, weight: .heavy, design: .rounded))
                                        Text("103")
                                            .font(.system(size: 18, weight: .regular, design: .rounded))
                                        
                                    }
                                    MovingRectanglesView()
                                         .padding(.top,10)
                                }
                                .frame(maxWidth: .infinity) // Each VStack takes up equal width
                                
                            }
                            Text("Activity")
                                .font(.system(size: 22, weight: .heavy, design: .rounded))
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
                            HStack{
                                Image("leeprofile")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .foregroundColor(.white)
                                Text("Lee Eberly")
                                Image(systemName: "message.fill")
                                    .foregroundColor(.green)
                                Spacer()
                                Text("Wow I was just ...")
                            }
                            HStack{
                                Image("kennprofile")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .foregroundColor(.white)
                                Text("Kennedy Siegler")
                                Image(systemName: "hand.wave.fill")
                                    .foregroundColor(.orange)
                                Spacer()
                                Text("When are we h ...")
                            }
                            Divider()
                            
                            Text("September")
                                .font(.system(size: 22, weight: .heavy, design: .rounded))
                                .foregroundColor(.white)
                            HStack{
                                Text("S")
                                    .frame(width:42, height:6)
                                    .foregroundColor(.gray)
                                Text("M")
                                    .frame(width:42, height:6)
                                    .foregroundColor(.gray)
                                Text("T")
                                    .frame(width:42, height:6)
                                    .foregroundColor(.gray)
                                Text("W")
                                    .frame(width:42, height:6)
                                    .foregroundColor(.gray)
                                Text("T")
                                    .frame(width:42, height:6)
                                    .foregroundColor(.gray)
                                Text("F")
                                    .frame(width:42, height:6)
                                    .foregroundColor(.gray)
                                Text("S")
                                    .frame(width:42, height:6)
                                    .foregroundColor(.gray)
                            }
                            HStack{
                                Image("test")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                    .frame(width:42, height:42)
                                    .cornerRadius(10)
                                Image("test3")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                    .frame(width:42, height:42)
                                    .cornerRadius(10)
                                Image("test4")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                    .frame(width:42, height:42)
                                    .cornerRadius(10)
                                Image("test5")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                    .frame(width:42, height:42)
                                    .cornerRadius(10)
                                Image("test6")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                    .frame(width:42, height:42)
                                    .cornerRadius(10)
                                Image("test7")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                    .frame(width:42, height:42)
                                    .cornerRadius(10)
                                Image("test6")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                    .frame(width:42, height:42)
                                    .cornerRadius(10)
                            }
                            HStack{
                                Image("test5")
                                    .resizable()
                                    .frame(width:42, height:42)
                                    .cornerRadius(10)
                                Image("test4")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                    .frame(width:42, height:42)
                                    .cornerRadius(10)
                                ZStack{
                                    Rectangle()
                                        .frame(width:42, height:42)
                                        .cornerRadius(10)
                                        .foregroundColor(.blue)
                                    Rectangle()
                                        .frame(width:42, height:42)
                                        .cornerRadius(10)
                                        .foregroundStyle(.regularMaterial)
                                    
                                    Text("22")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 18, weight: .heavy, design: .rounded))
                                }
                                ZStack{
                                    Rectangle()
                                        .frame(width:42, height:42)
                                        .cornerRadius(10)
                                        .foregroundColor(.blue)
                                    Rectangle()
                                        .frame(width:42, height:42)
                                        .cornerRadius(10)
                                        .foregroundStyle(.regularMaterial)
                                    
                                    Text("21")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 18, weight: .heavy, design: .rounded))
                                }
                                Image("test4")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                    .frame(width:42, height:42)
                                    .cornerRadius(10)
                                Image("test5")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                    .frame(width:42, height:42)
                                    .cornerRadius(10)
                                Image("test")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                    .frame(width:42, height:42)
                                    .cornerRadius(10)
                            }
                            HStack{
                                Image("test3")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                    .frame(width:42, height:42)
                                    .cornerRadius(10)
                                Image("test6")
                                    .resizable()
                                    .frame(width:42, height:42)
                                    .cornerRadius(10)
                                ZStack{
                                    Rectangle()
                                        .frame(width:42, height:42)
                                        .cornerRadius(10)
                                        .foregroundStyle(.regularMaterial)
                                    Text("15")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 18, weight: .heavy, design: .rounded))
                                }
                                Image("test4")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                    .frame(width:42, height:42)
                                    .cornerRadius(10)
                                Image("test3")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                    .frame(width:42, height:42)
                                    .cornerRadius(10)
                                Image("test")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                    .frame(width:42, height:42)
                                    .cornerRadius(10)
                                Image("test5")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                    .frame(width:42, height:42)
                                    .cornerRadius(10)
                            }
                            HStack{
                                Image("test7")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                    .frame(width:42, height:42)
                                    .cornerRadius(10)
                                Image("test4")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                    .frame(width:42, height:42)
                                    .cornerRadius(10)
                                Image("test")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width:42, height:42)
                                    .cornerRadius(10)
                                Image("test3")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                    .frame(width:42, height:42)
                                    .cornerRadius(10)
                                Image("test5")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                    .frame(width:42, height:42)
                                    .cornerRadius(10)
                                ZStack{
                                    Rectangle()
                                        .frame(width:42, height:42)
                                        .cornerRadius(10)
                                        .foregroundColor(.blue)
                                    Rectangle()
                                        .frame(width:42, height:42)
                                        .cornerRadius(10)
                                        .foregroundStyle(.regularMaterial)
                                    
                                    Text("5")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 18, weight: .heavy, design: .rounded))
                                }
                                ZStack{
                                    Rectangle()
                                        .frame(width:42, height:42)
                                        .cornerRadius(10)
                                        .foregroundStyle(.regularMaterial)
                                    Text("4")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 18, weight: .heavy, design: .rounded))
                                }
                            }
                            HStack{
                                Image("test3")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill) // Maintain aspect ratio and fill the frame
                                    .frame(width: 42, height: 42)
                                    .cornerRadius(10)
                                    .clipped()
                                ZStack{
                                    Rectangle()
                                        .frame(width:42, height:42)
                                        .cornerRadius(10)
                                        .foregroundStyle(.regularMaterial)
                                    Text("2")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 18, weight: .heavy, design: .rounded))
                                }
                                ZStack{
                                    Rectangle()
                                        .frame(width:42, height:42)
                                        .cornerRadius(10)
                                        .foregroundStyle(.regularMaterial)
                                    Text("1")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 18, weight: .heavy, design: .rounded))
                                }
                                
                            }
                            Divider()
                            Text("Folders")
                                .font(.system(size: 22, weight: .heavy, design: .rounded))
                                .foregroundColor(.white)
                            ZStack {
                                        Image("test4")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                            .frame(width: .infinity, height: 150) // Use maxWidth for full width
                                            .cornerRadius(20)

                                        Rectangle()
                                            .fill(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [Color.black,
                                                        Color.clear]),
                                                    startPoint: .bottom,
                                                    endPoint: .center
                                                    
                                                )
                                                
                                            )
                                
                                            .cornerRadius(20)
                                            .frame(height: 150)

                                        VStack {
                                            Spacer() // Pushes the text to the bottom
                                            
                                            HStack {
                                                Text("Arizona")
                                                    .font(.system(size: 22, weight: .heavy, design: .rounded))
                                                    .foregroundColor(.white) // Ensure the text is visible
                                                    .padding([.leading, .bottom], 10) // Add padding to the bottom and left
                                                Spacer() // Pushes the text to the left
                                            }
                                        }
                                        .frame(height: 150) // Match the frame height to the image and gradient
                                    }
                                     // Add some horizontal padding if needed
                            ZStack {
                                        Image("test")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                            .frame(width: .infinity, height: 150) // Use maxWidth for full width
                                            .cornerRadius(20)

                                        Rectangle()
                                            .fill(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [Color.black,
                                                        Color.clear]),
                                                    startPoint: .bottom,
                                                    endPoint: .center
                                                    
                                                )
                                                
                                            )
                                
                                            .cornerRadius(20)
                                            .frame(height: 150)

                                        VStack {
                                            Spacer() // Pushes the text to the bottom
                                            HStack {
                                                Text("Charlotte")
                                                    .font(.system(size: 22, weight: .heavy, design: .rounded))
                                                    .foregroundColor(.white) // Ensure the text is visible
                                                    .padding([.leading, .bottom], 10) // Add padding to the bottom and left
                                                Spacer() // Pushes the text to the left
                                            }
                                        }
                                        .frame(height: 150) // Match the frame height to the image and gradient
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
    Profile()
}
