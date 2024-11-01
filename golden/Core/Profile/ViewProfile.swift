import SwiftUI
import UIKit
struct ViewProfile: View {
    @State private var usersearch: String = ""
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var colorSelection = ColorSelection()
    let labels = ["Charleston", "New York", "Lexington", "Charlotte", "Greenville"]
    @State private var rotation: CGFloat = 0.0
    @State private var showMeshGradient = false // State to control the MeshGradient visibility
    @State private var isIconReplaced = false
    @Environment(\.colorScheme) var colorScheme
    @State private var rectangleColor = Color.green
    @State private var fade = Color.white
    @State private var showFollowedBanner = false
    @State private var showview = false
    @State private var fadeAmount: Double = 0
    var body: some View {
        ScrollView {
            GeometryReader { geometry in
                let offset = geometry.frame(in: .global).minY
                let scale = offset > 0 ? 1 + min(offset / 200, 1) : 1
                
                ZStack(alignment: .bottom) {
                    ZStack(alignment: .top) {
                        Image("joshlarge")
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width, height: 392 + (offset > 0 ? offset : 0))
                            .clipped()
                            .scaleEffect(x: scale, y: scale, anchor: .bottom)
                            .offset(y: offset > 0 ? -offset : 0)
                        
                        // Show MeshGradient if the state is true
                       
                            FollowGradient()
                                .transition(.opacity) // Transition for fading
                                .frame(width: showview ? .infinity : 0)
                                .edgesIgnoringSafeArea(.all) // Make the gradient cover the whole view
                                .opacity(0.4)
                                .animation(.easeInOut(duration: 0.5), value: showview)
                                .opacity(fadeAmount)
                        HStack {
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                ZStack {
                                    Circle()
                                        .frame(width: 30)
                                        .foregroundStyle(.ultraThinMaterial)
                                    Image(systemName: "chevron.backward")
                                        .resizable()
                                        .frame(width: 8, height: 14)
                                        .foregroundColor(.white)
                                        .bold()
                                        .offset(x: -1)
                                }
                            }
                            
                            Spacer()
                            
                            ZStack {
                                Circle()
                                    .frame(width: 30)
                                    .foregroundStyle(.ultraThinMaterial)
                                Image(systemName: "star")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                                    .foregroundColor(.white)
                                    .bold()
                                    .offset(y: -1)
                            }
                            .padding(.trailing, 5)
                            
                            Menu {
                                Button {
                                    // Action for September
                                } label: {
                                    Label("Restrict", systemImage: "none")
                                }
                                Button {
                                    // Action for August
                                } label: {
                                    Label("Block", systemImage: "none")
                                }
                                Button {
                                    // Action for July
                                } label: {
                                    Label("Report", systemImage: "none")
                                }
                                Button {
                                    // Action for July
                                } label: {
                                    Label("Remove Follower", systemImage: "none")
                                }
                                Button {
                                    // Action for July
                                } label: {
                                    Label("Share Profile", systemImage: "none")
                                }
                            } label: {
                                ZStack {
                                    Circle()
                                        .frame(width: 30)
                                        .foregroundStyle(.ultraThinMaterial)
                                    Image(systemName: "ellipsis")
                                        .resizable()
                                        .frame(width: 16, height: 3)
                                        .foregroundColor(.white)
                                        .bold()
                                        .offset(y: -1)
                                }
                            }
                        }
                        .padding(.horizontal, 12)
                        .padding(.top, 65)
                    }
                    
                    HStack {
                        Text("Josh Powers")
                            .padding()
                            .foregroundColor(.white)
                            .font(.system(size: 32, weight: .bold, design: .default))
                            .scaleEffect(anchor: .bottom)
                        
                        Spacer()
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundColor(.orange)
                                .frame(width: 35, height: 35)
                            Image(systemName: "hand.wave.fill")
                                .resizable()
                                .frame(width: 18, height: 18)
                                .foregroundColor(.white)
                            
                        }
                        
                        Button(action: {
                                   
                                    withAnimation(.easeInOut(duration: 1.5)){
                                        
                                        isIconReplaced.toggle()
                                        rectangleColor = rectangleColor == .blue ? .green : .blue
                                        fade = fade == .white ? .white : .white
                                    }

                                    
                                }) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 30)
                                            .foregroundColor(rectangleColor) // Dynamic color
                                            .frame(width: 35, height: 35)
                                        RoundedRectangle(cornerRadius: 30)
                                            .foregroundColor(fade) // Dynamic color
                                            .frame(width: 18, height: 18)

                                        Image(systemName: isIconReplaced ? "checkmark.circle.fill" : "plus.circle.fill")
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                            .foregroundColor(rectangleColor)
                                    }
                                }
                        .padding(.trailing, 15)
                        .animation(.default, value: isIconReplaced)
                    }
                    .scaleEffect(anchor: .bottom)
                    .offset(y: offset > 0 ? -offset : 0)
                }
            }
            .frame(height: 392)
            VStack(alignment: .leading) {
                HStack{
                    Text("Mutual Friends")
                        .font(.system(size: 24, weight: .bold, design: .default))
                    Image(systemName: "chevron.right")
                        .bold()
                        .foregroundColor(.gray)
                }
                        HStack(spacing: 8) { // Small spacing between the images and the text if needed
                            // ZStack for overlapping images
                            ZStack {
                                ZStack{
                                    Circle()
                                        .frame(width: 65, height: 65)
                                        .foregroundColor(colorScheme == .dark ? .black : .white)
                                    Image("leeprofile")
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                        
                                }
                                .offset(x: 30)
                                ZStack{
                                    Circle()
                                        .frame(width: 65, height: 65)
                                        .foregroundColor(colorScheme == .dark ? .black : .white)
                                    Image("kennprofile")
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                        
                                }

                                ZStack{
                                    Circle()
                                        .frame(width: 65, height: 65)
                                        .foregroundColor(colorScheme == .dark ? .black : .white)
                                    Image("jackprofile")
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                        
                                }
                                .offset(x:-30)
                            }
                            .padding(.trailing,10)
                            .frame(width: 90, height: 60) // Control the size of the ZStack to contain the overlapping images
                            
                           
                                Text("@leeeberly, @kennsiegler, @jackamlo, and 12 more")
                                    .font(.system(size: 16))
                                    .padding(.leading, 8) // Add a bit of space between images and text for readability
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading) // Align everything to the left
                        .padding(.horizontal, 20)

                        ProfileRecent()
                            .padding(.top, 15)
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
            VStack(alignment: .leading) {
                ZStack {
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundStyle(.ultraThinMaterial)

                    VStack(alignment: .leading) {
                        Text("About Josh Powers")
                            .font(.system(size: 24, weight: .heavy, design: .default))
                            .padding(.top, 20)
                            .padding(.bottom, 10)
                        Text("Location")
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .foregroundColor(.gray)
                        Text("Charleston, SC")
                            .font(.system(size: 16, weight: .regular, design: .default))
                            .padding(.bottom, 10)
                        Text("Following")
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .foregroundColor(.gray)
                        Text("102")
                            .font(.system(size: 16, weight: .regular, design: .default))
                            .padding(.bottom, 10)
                        Text("Followers")
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .foregroundColor(.gray)
                        Text("1,543")
                            .font(.system(size: 16, weight: .regular, design: .default))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading) // Ensure the inner VStack takes full width and aligns left
                    .padding(.horizontal, 25) // Add padding to match the "Recent" and "Mutual Friends" sections
                    .padding(.bottom, 50)
                    
                }
                
            }
            
            .padding(.horizontal, 0)
            
        }
        .scrollIndicators(.hidden)
            .ignoresSafeArea(edges: .all)
        
    }
}

#Preview {
    ViewProfile()
}
