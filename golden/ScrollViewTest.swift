import SwiftUI

struct ScrollViewTest: View {
    @State private var currentIndex = 0
    let photos = [ "test", "test3", "test4", "test5"]
     
        var body: some View {
            GeometryReader { geometry in
                ScrollView(.vertical) {
                    VStack(alignment: .center) {
                        ForEach(photos.indices) { index in
                            Image(photos[index])
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width - 50, height:geometry.size.height - 120)
                                .cornerRadius(25)
                                .padding(.horizontal, 25)
                                .id(index)
                                .onChange(of: currentIndex, {
                                    currentIndex += 1
                                })
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
            }
        }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewTest()
    }
}
