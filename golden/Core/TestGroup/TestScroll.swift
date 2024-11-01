import SwiftUI

struct TestScroll: View {
    @State private var scrollOffset: CGFloat = 0 // Track scroll position

    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 20) {
                // First ScrollView
                ScrollViewReader { proxy in
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 20) {
                            ForEach(0..<20) { index in
                                Text("Item \(index + 1)")
                                    .frame(width: 300, height: 100)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                    .id(index) // Assign ID for ScrollViewReader
                                    .background(
                                        GeometryReader { geometry in
                                            Color.clear
                                                .preference(key: ScrollOffsetPreferenceKey.self, value: geometry.frame(in: .global).minY)
                                                .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                                                    // Update scroll offset
                                                    scrollOffset = value
                                                }
                                        }
                                    )
                            }
                        }
                    }
                    .frame(height: 400)
                    .onChange(of: scrollOffset) { newValue in
                        let index = Int(abs(newValue) / 100) // Assuming each item is 100 points in height
                        if index < 20 {
                            // Scroll to the corresponding item in the second scroll view
                            withAnimation {
                                proxy.scrollTo(index, anchor: .top)
                            }
                        }
                    }
                }
            }
            .padding()
            
            // Second ScrollView that scrolls with the first
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach(0..<20) { index in
                        Text("Linked Item \(index + 1)")
                            .frame(width: 300, height: 100)
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                }
                .background(
                    GeometryReader { geometry in
                        Color.clear
                            .onChange(of: scrollOffset) { newValue in
                                let index = Int(abs(newValue) / 100) // Assuming each item is 100 points in height
                                if index < 20 {
                                    // Scroll to the corresponding item in the second scroll view
                                    DispatchQueue.main.async {
                                        let targetOffset = CGFloat(index) * 100 // Target scroll offset for the second scroll view
                                        withAnimation {
                                            UIScrollView.appearance().setContentOffset(CGPoint(x: 0, y: targetOffset), animated: true)
                                        }
                                    }
                                }
                            }
                    }
                )
            }
            .frame(height: 400)
        }
    }
}

// Custom PreferenceKey to track scroll offset
struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct TestScroll_Preview: PreviewProvider {
    static var previews: some View {
        TestScroll()
    }
}
