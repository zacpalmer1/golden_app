import SwiftUI

struct MainView: View {
    @State private var currentIndex: Int = 0 // Shared index to synchronize both views

    var body: some View {
        HStack {
            // Two completely different views with their own scroll views
            FirstScrollView(currentIndex: $currentIndex)
            SecondScrollView(currentIndex: $currentIndex)
        }
    }
}

struct FirstScrollView: View {
    @Binding var currentIndex: Int

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(0..<50, id: \.self) { index in
                        Text("First View Item \(index)")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green.opacity(0.3))
                            .cornerRadius(8)
                            .id(index)
                            .background(
                                GeometryReader { geo in
                                    Color.clear.onAppear {
                                        updateIndexIfNeeded(geo: geo, index: index)
                                    }
                                    .onChange(of: geo.frame(in: .global).minY) { _ in
                                        updateIndexIfNeeded(geo: geo, index: index)
                                    }
                                }
                            )
                    }
                }
            }
            .onChange(of: currentIndex) { newIndex in
                // Scroll to the updated index when it changes
                withAnimation {
                    proxy.scrollTo(newIndex, anchor: .center)
                }
            }
        }
    }

    private func updateIndexIfNeeded(geo: GeometryProxy, index: Int) {
        let frame = geo.frame(in: .global)
        if frame.midY > 200 && frame.midY < 600 { // Adjust bounds based on screen size
            if currentIndex != index {
                currentIndex = index
            }
        }
    }
}

struct SecondScrollView: View {
    @Binding var currentIndex: Int

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(0..<50, id: \.self) { index in
                        Text("Second View Item \(index)")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue.opacity(0.3))
                            .cornerRadius(8)
                            .id(index)
                            .background(
                                GeometryReader { geo in
                                    Color.clear.onAppear {
                                        updateIndexIfNeeded(geo: geo, index: index)
                                    }
                                    .onChange(of: geo.frame(in: .global).minY) { _ in
                                        updateIndexIfNeeded(geo: geo, index: index)
                                    }
                                }
                            )
                    }
                }
            }
            .onChange(of: currentIndex) { newIndex in
                // Scroll to the updated index when it changes
                withAnimation {
                    proxy.scrollTo(newIndex, anchor: .center)
                }
            }
        }
    }

    private func updateIndexIfNeeded(geo: GeometryProxy, index: Int) {
        let frame = geo.frame(in: .global)
        if frame.midY > 200 && frame.midY < 600 { // Adjust bounds based on screen size
            if currentIndex != index {
                currentIndex = index
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
