import SwiftUI

struct Home: View {
    @Namespace var animation
    @State private var currentImageIndex = 0
    @State private var backgroundOpacity: Double = 1.0
    @StateObject private var colorSelection = ColorSelection()
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack {
            ZStack {
                // Background image with dynamic opacity
                
                //MessagesGradient(colorSelection: colorSelection)
                Image(MockData.items[currentImageIndex])
                                  .resizable()
                                  
                                  .opacity(backgroundOpacity)
                                  .ignoresSafeArea()
                Rectangle()
                    .foregroundStyle(.ultraThinMaterial)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    Rectangle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.black, Color.clear]), // Gradient from black to clear
                                startPoint: .bottom, // Gradient starts at the bottom
                                endPoint: .top // Gradient ends at the top
                            )
                        )
                        .frame(height: 200)
                    
                    Rectangle()
                        .frame(height: 630)
                        .foregroundColor(.black)
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    ScrollViewReader { proxy in
                        VStack(spacing: 0) {
                            ForEach(MockData.items.indices, id: \.self) { index in
                                Image(MockData.items[index])
                                    .resizable()
                                
                                    .frame(height: 750) // Adjust size as needed
                                    .cornerRadius(40)
                                    .containerRelativeFrame(.vertical, count: 1, spacing: 0)
                                    
                                    .scrollTransition { content, phase in
                                        content
                                            .opacity(phase.isIdentity ? 1 : 0.1)
                                            .scaleEffect(x: phase.isIdentity ? 1 : 0.1,
                                                         y: phase.isIdentity ? 1 : 0.1)
                                    }
                                    .id(index)
                                    .background(GeometryReader { geo in
                                        Color.clear
                                            .onChange(of: geo.frame(in: .global).minY) { newValue in
                                                // Update the background image index
                                                if abs(newValue) < 500 { // Adjust this threshold based on your image height
                                                    DispatchQueue.main.async {
                                                        currentImageIndex = index
                                                    }
                                                }
                                            }
                                    })
                            }
                            .padding(.vertical, 0)
                        }
                        .scrollTargetLayout()
                        .background(GeometryReader { geo in
                            Color.clear
                                .onChange(of: geo.frame(in: .global).minY) { newOffset in
                                    // Calculate the opacity based on the scroll offset
                                    let threshold: CGFloat = 700 // Adjust this threshold based on your needs
                                    let opacity = min(max(1 - (newOffset / threshold), 0), 1)
                                    withAnimation {
                                        backgroundOpacity = opacity
                                    }
                                }
                        })
                    }
                }
                .offset(y:100)
                .frame(height: 750)
                .scrollTargetBehavior(.paging)
                .ignoresSafeArea(edges: .bottom)
                ZStack {
                    

                    VStack {
                        Spacer() // Pushes the rectangle to the bottom

                       
                    }
                    //TestBubbleView()
                       // .padding(.bottom, 40)
                }
            }
           
            
        }
        .colorScheme(.dark)
    }
}

struct MockData {
    static let items = ["test", "test3", "test4", "test5", "test6", "test7"]
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
