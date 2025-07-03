import SwiftUI
import UIKit

struct ViewProfile: View {
    var user: UserFeedItem

    @State private var usersearch: String = ""
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var colorSelection = ColorSelection()
    let labels = ["Charleston", "New York", "Lexington", "Charlotte", "Greenville"]
    @State private var rotation: CGFloat = 0.0
    @State private var showMeshGradient = false
    @State private var isIconReplaced = false
    @Environment(\.colorScheme) var colorScheme
    @State private var rectangleColor = Color.green
    @State private var fade = Color.white
    @State private var showFollowedBanner = false
    @State private var showview = false
    @State private var fadeAmount: Double = 0
    @State private var scale: CGFloat = 1.0  // New scale state to reset on dismissal

    var body: some View {
        
        ScrollView {
            GeometryReader { geometry in
                
                
                ZStack(alignment: .bottom) {
                    ZStack(alignment: .top) {
                        Image(user.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width, height: 392)
                            .clipped()
                            
                        
                        // Show MeshGradient if the state is true
                        FollowGradient()
                            .transition(.opacity)
                            .frame(width: showview ? .infinity : 0)
                            .edgesIgnoringSafeArea(.all)
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
                                Button { } label: { Label("Restrict", systemImage: "none") }
                                Button { } label: { Label("Block", systemImage: "none") }
                                Button { } label: { Label("Report", systemImage: "none") }
                                Button { } label: { Label("Remove Follower", systemImage: "none") }
                                Button { } label: { Label("Share Profile", systemImage: "none") }
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
                    
                    HStack(alignment: .bottom) {
                        Text(user.name)
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
                        .padding(.bottom)
                        Button(action: {
                            withAnimation(.easeInOut(duration: 1.5)) {
                                isIconReplaced.toggle()
                                rectangleColor = rectangleColor == .blue ? .green : .blue
                                fade = fade == .white ? .white : .white
                            }
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 30)
                                    .foregroundColor(rectangleColor)
                                    .frame(width: 35, height: 35)
                                RoundedRectangle(cornerRadius: 30)
                                    .foregroundColor(fade)
                                    .frame(width: 18, height: 18)
                                
                                Image(systemName: isIconReplaced ? "checkmark.circle.fill" : "plus.circle.fill")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(rectangleColor)
                            }
                        }
                        .padding(.bottom)
                        .padding(.trailing, 15)
                        .animation(.default, value: isIconReplaced)
                    }
                    .scaleEffect(anchor: .bottom)
                    
                }
            }
            .frame(height: 392)
            .onDisappear { scale = 0.0 }  // Reset scale on dismissal

            // Rest of your VStack and content here...
        }
        .scrollIndicators(.hidden)
        .ignoresSafeArea(edges: .all)
    }
}


