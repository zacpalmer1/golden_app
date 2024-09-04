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
    let labels = ["Charleston", "New York", "Lexington", "Charlotte", "Greenville"]
    var body: some View {
        ZStack {
            // Background image with dynamic opacity
            Image("favorite3")
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
                    ZStack{
                        VStack {
                            
                            VStack(alignment: .leading, spacing: 16) {
                                
                                HStack(spacing: 0) { // Set spacing to 0 to remove the default spacing
                                    VStack {
                                        
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
                                            ZStack{
                                                
                                                Image("joshprofile")
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
                                        
                                        Text("Josh Powers")
                                            .font(.system(size: 18, weight: .heavy, design: .rounded))
                                            .foregroundColor(.white)
                                        Text("@joshpowers1")
                                            .font(.system(size: 16, weight: .regular, design: .rounded))
                                            .padding(.bottom, 10)
                                            .foregroundColor(.white)
                                        HStack{
                                            Spacer()
                                            Text("Following:")
                                                .font(.system(size: 16, weight: .bold, design: .rounded))
                                                .foregroundColor(.white)
                                            Text("102")
                                                .font(.system(size: 16, weight: .regular, design: .rounded))
                                                .foregroundColor(.white)
                                            Spacer()
                                            Text("Followers:")
                                                .font(.system(size: 16, weight: .bold, design: .rounded))
                                                .foregroundColor(.white)
                                            Text("156")
                                                .font(.system(size: 16, weight: .bold, design: .rounded))
                                                .foregroundColor(.white)
                                            Spacer()
                                        }
                                        .padding(.horizontal, 25)
                                        .padding(.bottom,15)
                                        HStack{
                                            ZStack{
                                                Rectangle()
                                                    .frame(width:100, height:30)
                                                    .foregroundColor(.green)
                                                    .cornerRadius(10)
                                                Text("Follow")
                                                    .font(.system(size: 16, weight: .bold, design: .rounded))
                                                    .foregroundColor(.white)
                                            }
                                            ZStack{
                                                Rectangle()
                                                    .frame(width:100, height:30)
                                                    .foregroundColor(.blue)
                                                    .cornerRadius(10)
                                                Text("Message")
                                                    .font(.system(size: 16, weight: .bold, design: .rounded))
                                                    .foregroundColor(.white)
                                            }
                                            
                                        }
                                        
                                        
                                        HStack{
                                            
                                           MovingRectanglesView()
                                                .padding(.top,20)
                                        }
                                        
                                    }
                                    .frame(maxWidth: .infinity) // Each VStack takes up equal width
                                    
                                }
                                
                                Text("September")
                                    .font(.system(size: 22, weight: .heavy, design: .rounded))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 25)
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
                                .padding(.horizontal, 25)
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
                                .padding(.horizontal, 25)
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
                                .padding(.horizontal, 25)
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
                                .padding(.horizontal, 25)
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
                                .padding(.horizontal, 25)
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
                                .padding(.horizontal, 25)
                            }
                            
                            .padding(.top, 10)
                            .frame(maxWidth: .infinity) // Allow VStack to take up available width
                             // Add margin on both sides, allowing for more padding
                            
                        }
                        .frame(maxWidth: .infinity)
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
