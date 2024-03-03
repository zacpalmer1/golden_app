
import SwiftUI

extension Animation {
    static var lessBouncy: Animation {
        Animation.interpolatingSpring(stiffness: 150, damping: 20, initialVelocity: 5)
    }
}

struct UserBubble: View {
    var animation: Namespace.ID
    @Binding var expand: Bool
    var height = UIScreen.main.bounds.height / 7
    @State private var dragOffset: CGSize = .zero

    var body: some View {
        ZStack {
            Rectangle()
                .frame(maxWidth: expand ? .infinity : 360, maxHeight: expand ? .infinity : 52)
                .cornerRadius(15)
                .offset(x: 0, y: expand ? dragOffset.height : 300)
                .foregroundStyle(expand ? .ultraThinMaterial : .ultraThinMaterial)

            HStack {
                if expand { Spacer(minLength: 0) }
                HStack {
                    Image("profile")
                        .resizable()
                        .frame(width: expand ? height : 35, height: expand ? height : 35)
                        .offset(x: 0, y: expand ? -260 : 300)
                }
                if !expand {
                    Text("zacpalmer1")
                        .offset(x: 0, y: expand ? 0 : 300)
                        .foregroundColor(.white)
                    Image(systemName: "sun.horizon.fill")
                        .offset(x: 29, y: expand ? 0 : 300)
                        .foregroundColor(.white)
                    Text("2")
                        .offset(x: 29, y: expand ? 0 : 300)
                        .foregroundColor(.white)
                    Image(systemName: "heart.fill")
                        .offset(x: 39, y: expand ? 0 : 300)
                        .foregroundColor(.white)
                    Text("3")
                        .offset(x: 39, y: expand ? 0 : 300)
                        .foregroundColor(.white)
                    Image(systemName: "message.fill")
                        .offset(x: 49, y: expand ? 0 : 300)
                        .foregroundColor(.white)
                    Text("8")
                        .offset(x: 49, y: expand ? 0 : 300)
                        .foregroundColor(.white)
                }
                Spacer()
            }
            .padding(28)
            VStack {
                if expand {
                    UserBubbleExpanded()
                        .offset(y: 240)

                }

            }
            .animation(.snappy(duration: 0.1))
        }
        .gesture(
            TapGesture()
                .onEnded { _ in
                    withAnimation(.snappy()) {
                        expand.toggle()
                    }
                }
                .simultaneously(
                    with: DragGesture()
                        .onChanged { value in
                            // Allow dragging only when expanded
                            if expand {
                                dragOffset = value.translation
                            }
                        }
                        .onEnded { value in
                            // Check if the drag exceeds a threshold to unexpand
                            let threshold: CGFloat = 100
                            if value.translation.height > threshold {
                                withAnimation(.lessBouncy) {
                                    expand = false
                                }
                            }
                            dragOffset = .zero
                        }
                )
        )
        .ignoresSafeArea()
    }
}
