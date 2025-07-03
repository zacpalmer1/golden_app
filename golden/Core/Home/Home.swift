import SwiftUI
import Combine

class ScrollSyncManager: ObservableObject {
    @Published var currentIndex: Int = 0 // Shared index to synchronize TestBubbleView
}

struct Home: View {
    @Namespace var animation
    @State private var currentImageIndex = 0
    @State private var currentAmount: CGFloat = 0
    @State private var backgroundOpacity: Double = 1.0
    @StateObject private var scrollSyncManager = ScrollSyncManager()
    @State private var hoverOffset: CGFloat = 0.0
    @State private var showScrollDown = true // Initial visibility of "Scroll Down" text
    @State private var hasScrolled = false
    @Environment(\.colorScheme) var colorScheme
    @State private var showDaytimeGradient = false
    @Binding var isIconColored: Bool
    @State private var likedHeart = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
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
                                    gradient: Gradient(colors: [Color.black, Color.clear]),
                                    startPoint: .bottom,
                                    endPoint: .top
                                )
                            )
                            .containerRelativeFrame([.horizontal, .vertical], { length, axis in
                                if axis == .vertical {
                                    return length / 4
                                }
                                else{
                                    return length
                                }
                            })
                        
                        Rectangle()
                            .containerRelativeFrame([.horizontal, .vertical], { length, axis in
                                if axis == .vertical {
                                    return length / 1.19
                                }
                                else{
                                    return length
                                }
                            })
                            .foregroundColor(.black)
                    }
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        ScrollViewReader { proxy in
                            VStack(spacing: 0) {
                                ForEach(MockData.items.indices, id: \.self) { index in
                                    Image(MockData.items[index])
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .containerRelativeFrame([.horizontal, .vertical], {length, axis in
                                            if axis == .vertical {
                                                return length / 1.03
                                            }
                                            else{
                                                return length
                                            }
                                        })
                                        .cornerRadius(40)
                                        .scaleEffect(1 + currentAmount)
                                        .gesture(
                                            MagnificationGesture()
                                                .onChanged{ value in
                                                    currentAmount = value - 1
                                                }
                                                .onEnded{ value in
                                                    withAnimation(.spring()){
                                                        currentAmount = 0
                                                    }
                                                }
                                        )
                                        .overlay(
                                            showDaytimeGradient ? Image(systemName: "heart.fill")
                                                .resizable()
                                                .frame(width: 100, height: 90)
                                                .offset(y:-50)
                                                .foregroundColor(.pink)
                                                .transition(.opacity)
                                                .opacity(1.0) : nil
                                        )
                                        .onTapGesture(count: 2) {
                                            withAnimation(.easeInOut(duration: 0.5)) {
                                                isIconColored.toggle()
                                                likedHeart.toggle()
                                                showDaytimeGradient = true
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                                                withAnimation(.easeInOut(duration: 0.5)) {
                                                    showDaytimeGradient = false
                                                }
                                            }
                                        }
                                        .containerRelativeFrame(.vertical, count: 1, spacing: 0)
                                    
                                        .scrollTransition { content, phase in content
                                                .opacity(phase.isIdentity ? 1 : 0.5)
                                                .scaleEffect(x: phase.isIdentity ? 1 : 0.2, y: phase.isIdentity ? 1 : 0.2)
                                        }
                                        .id(index)
                                        .background(
                                            GeometryReader { geo in
                                                Color.clear
                                                    .onChange(of: geo.frame(in: .global).minY) { newValue in
                                                        if abs(newValue) < 300 {
                                                            DispatchQueue.main.async {
                                                                currentImageIndex = index
                                                                scrollSyncManager.currentIndex = index
                                                            }
                                                        }
                                                        if newValue <= -400 && !hasScrolled {
                                                            withAnimation {
                                                                showScrollDown = false
                                                            }
                                                            hasScrolled = true
                                                        }
                                                    }
                                            }
                                        )
                                }
                                .padding(.vertical, 0)
                            }
                        }
                    }
                    .offset(y:65)
                    .containerRelativeFrame([.horizontal, .vertical], { length, axis in
                        if axis == .vertical {
                            return length / 1.0
                        }
                        else{
                            return length
                        }
                    })
                    .scrollTargetBehavior(.paging)
                    .ignoresSafeArea(edges: .bottom)
                    
                    if showScrollDown {
                        HStack {
                            Text("Scroll Down")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium, design: .default))
                            Image(systemName: "chevron.down")
                                .resizable()
                                .frame(width: 13, height: 6)
                                .foregroundColor(.white)
                        }
                        .opacity(showScrollDown ? 1 : 0)
                        .animation(.easeInOut(duration: 5.5), value: showScrollDown)
                        .offset(y: hoverOffset + 220)
                        .onAppear {
                            withAnimation(
                                Animation.easeInOut(duration: 1.5)
                                    .repeatForever(autoreverses: true)
                            ) {
                                hoverOffset = -5
                            }
                        }
                    }
                    //TestBubbleView(scrollSyncManager: scrollSyncManager, isIconColored: $isIconColored)
                      //  .offset(y: -35)
                }
            }
        }
        
    }
}

struct MockData {
    static let items = ["test", "test3", "test4", "test5", "test6", "test7"]
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ParentView()
        
    }
}

struct ParentView: View {
    @State private var isIconColored = false
    
    var body: some View {
        Home(isIconColored: $isIconColored)
    }
}
