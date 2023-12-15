import SwiftUI

struct Home: View {
    @Namespace var animation
    @State var currentImageIndex = 0

    var body: some View {
        VStack {
            ZStack {
                Image(MockData.items[currentImageIndex])
                    .resizable()
                    .frame(width: .infinity, height: .infinity)
                    .ignoresSafeArea()
                Rectangle()
                    .foregroundStyle(.bar)
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
                            .tag(index)
                    }
                }
                .scrollTargetLayout()
            }
            .frame(width: 345, height: 650)
            .padding(.all)
            .scrollTargetBehavior(.paging)
            .background(GeometryReader {
                Color.clear.preference(key: ViewOffsetKey.self,
                                       value: [$0.frame(in: .global).minY])
            })

            
            }
            .onPreferenceChange(ViewOffsetKey.self, perform: { offsets in
                if let firstVisibleOffset = offsets.first {
                    let newIndex = Int(firstVisibleOffset / 650) // Assuming image height is 640
                    currentImageIndex = max(0, min(MockData.items.count - 1, newIndex))
                }
            })
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
