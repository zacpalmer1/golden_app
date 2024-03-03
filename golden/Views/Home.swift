import SwiftUI

struct Home: View {
    @Namespace var animation
    @State var currentImageIndex = 0
    @State private var backgroundOpacity: Double = 1.0
    var body: some View {
        VStack {
            ZStack {
                Image(MockData.items[currentImageIndex])
                    .resizable()
                    .frame(width: .infinity, height: .infinity)
                    .opacity(backgroundOpacity)
                    .ignoresSafeArea()
                Rectangle()
                    .foregroundStyle(.ultraThinMaterial)
                    .ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    ForEach(MockData.items.indices, id: \.self) { index in
                        Image(MockData.items[index])
                            .resizable()
                            .frame(width: 345, height: 640)
                            .cornerRadius(15)
                            .containerRelativeFrame(.vertical, count: 1, spacing: 12)
                            .scrollTransition { content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1 : 0.5)
                                    .scaleEffect(x: phase.isIdentity ? 1 : 0.7,
                                                 y: phase.isIdentity ? 1 : 0.7)
                            }
            
                            .id(index)
                    }
    
                }

                .scrollTargetLayout()
            }

            .frame(width: 345, height: 650)
            .padding(.all)
            .scrollTargetBehavior(.paging)
            
                Button("    ") {
                    withAnimation(Animation.linear(duration: 0.9)) {
                        if currentImageIndex < 5 {
                            currentImageIndex += 1
                        } else {
                            currentImageIndex = 0
                        }
                        backgroundOpacity = 1.0 // Set the desired fade-out opacity
                    }
                }
                
            }
            
        }
        
    }
}

struct ViewOffsetKey: PreferenceKey {
    static var defaultValue: [CGFloat] = []

    static func reduce(value: inout [CGFloat], nextValue: () -> [CGFloat]) {
        value.append(contentsOf: nextValue())
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
