import SwiftUI

struct TestSideView: View {
    @State private var path: [String] = []

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Text("Main View")
                    .font(.largeTitle)

                Button("Open Side View") {
                    path.append("SideView")
                }
                .padding()
            }
            .navigationDestination(for: String.self) { destination in
                if destination == "SideView" {
                    SideView()
                }
            }
        }
    }
}

struct SideView: View {
    var body: some View {
        VStack {
            Text("Side View")
                .font(.largeTitle)

            NavigationLink("Go Back", value: "")
                .padding()
        }
    }
}

struct TestSideView_Previews: PreviewProvider {
    static var previews: some View {
        TestSideView()
    }
}
