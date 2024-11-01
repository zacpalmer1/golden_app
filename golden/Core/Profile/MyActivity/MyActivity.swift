import SwiftUI

struct MyActivity: View {
    @State private var activity = false
    @State private var profile = false
    @Environment(\.colorScheme) var colorScheme

    // Define the items with explicit color types
    let items = [
        ("joshprofile", "Josh Powers", "heart.fill", "10:32 AM", Color.pink),
        ("leeprofile", "Lee Eberly", "message.fill", "Wow I was just ...", Color.green),
        ("kennprofile", "Kennedy Siegler", "hand.wave.fill", "Where was thi ...", Color.orange),
        ("jackprofile", "Jack Malo", "heart.fill", "10:32 AM", Color.pink),
        ("blakeprofile", "Blake Gillian", "heart.fill", "Wow I was just ...", Color.pink),
        ("roryprofile", "Rory Bostwick", "message.fill", "When are we h ...", Color.green)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Button(action: {
                activity.toggle()
            }) {
                HStack(spacing: 0) {
                    Text("Activity")
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .padding(.trailing, 6)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                    
                    Image(systemName: "chevron.right")
                        .bold()
                        .foregroundColor(.gray)
                    
                }
            }
            .fullScreenCover(isPresented: $activity) {
                MyActivityExpanded()
            }

            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing:10 ) {
                    ForEach(0..<items.count) { index in
                        HStack {
                            Image(items[index].0)
                                .resizable()
                                .frame(width: 35, height: 35)

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
                        
                    }
                    
                }
                
            }
            .frame(height: 130) // Same height as the original
            .scrollTargetLayout()
            .scrollTargetBehavior(.paging)
        }
        .padding(.horizontal, 0) // Removing any extra horizontal padding
    }
}

#Preview {
    MyActivity()
}
