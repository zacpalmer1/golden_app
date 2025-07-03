import SwiftUI

struct MyActivity: View {
    @State private var activity = false
    @State private var profile = false
    @Environment(\.colorScheme) var colorScheme

    // Define the items with explicit color types
    let items = [
        ("joshlarge", "Josh Powers", "heart.fill", "10:32 AM", Color.pink),
        ("kennlarge", "Kennedy Seigler", "message.fill", "Wow I was just ...", Color.green),
        ("lindalarge", "Lindsay McNamara", "hand.wave.fill", "Where was thi ...", Color.orange),
        ("blakelarge", "Blake Gillian", "heart.fill", "10:32 AM", Color.pink),
        ("zaclarge", "Zac Palmer", "heart.fill", "Wow I was just ...", Color.pink),
        ("zac2large", "Zachary Palmer", "message.fill", "When are we h ...", Color.green)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
           
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing:0 ) {
                    ForEach(0..<items.count) { index in
                        HStack {
                            Image(items[index].0)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 40, height: 40)
                                .clipped()
                                .cornerRadius(11)
                            Text(items[index].1)
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .font(.system(size: 16, weight: .regular, design: .default))

                            Image(systemName: items[index].2)
                                .foregroundColor(items[index].4)

                            Spacer()

                            Text(items[index].3)
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .font(.system(size: 14, weight: .regular, design: .default))
                        }
                        .containerRelativeFrame(.vertical, count: 3, spacing: 0)
                    }
                    
                }
                
            }
            
            .frame(height: 150) // Same height as the original
            .scrollTargetLayout()
            .scrollTargetBehavior(.paging)
        }
        .padding(.horizontal, 0) // Removing any extra horizontal padding
    }
}

#Preview {
    MyActivity()
}
