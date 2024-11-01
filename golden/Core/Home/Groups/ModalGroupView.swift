import SwiftUI

struct MovingRectanglesView: View {
    @State private var offset: CGFloat = 0
    @State private var offset2: CGFloat = 0 // For the second group
    let labels = ["Charleston", "Furman", "Greenville", "Cross Country", "Greenville"] // Different text for each rectangle
    let labels2 = ["MUSC", "Washington", "Man Buns", "New Orleans", "Austin"] // Different text for the second set
    private let scrollDuration: Double = 40.0 // Duration of the scroll animation

    var body: some View {
        VStack(spacing: 0) {
            // Reduced vertical spacing
            GeometryReader { geometry in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(labels.indices, id: \.self) { index in
                            ZStack {
                                Rectangle()
                                    .cornerRadius(10)
                                    .foregroundStyle(.ultraThinMaterial)
                                    .frame(height: 30)
                                    .frame(width: textWidth(for: labels[index]) + 40) // Add padding to the width
                                
                                Text(labels[index])
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 10) // Add padding to the text
                            }
                        }
                        // Duplicate the list to create an infinite scroll effect
                        ForEach(labels.indices, id: \.self) { index in
                            ZStack {
                                Rectangle()
                                    .cornerRadius(10)
                                    .foregroundStyle(.ultraThinMaterial)
                                    .frame(height: 30)
                                    .frame(width: textWidth(for: labels[index]) + 40) // Add padding to the width
                                
                                Text(labels[index])
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 10) // Add padding to the text
                            }
                        }
                    }
                    .offset(x: -offset)
                    .frame(width: geometry.size.width * 2, alignment: .leading) // Ensure the content width is enough to scroll
                    .animation(Animation.linear(duration: scrollDuration).repeatForever(autoreverses: false), value: offset)
                    .onAppear {
                        // Calculate the total width to scroll
                        let totalWidth = (textWidth(for: labels[0]) + 60) * CGFloat(labels.count) * 2 + 60 * CGFloat(labels.count - 1)
                        offset = totalWidth / 2 // Start scrolling from the middle to create an infinite effect
                    }
                }
                .clipped() // Ensure that content outside the view is clipped
            }
            .frame(height: 50) // Height of the first row of rectangles

            GeometryReader { geometry in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(labels2.indices, id: \.self) { index in
                            ZStack {
                                Rectangle()
                                    .cornerRadius(10)
                                    .foregroundStyle(.ultraThinMaterial)
                                    .frame(height: 30)
                                    .frame(width: textWidth(for: labels2[index]) + 40) // Add padding to the width
                                
                                Text(labels2[index])
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 10) // Add padding to the text
                            }
                        }
                        // Duplicate the list to create an infinite scroll effect
                        ForEach(labels2.indices, id: \.self) { index in
                            ZStack {
                                Rectangle()
                                    .cornerRadius(10)
                                    .foregroundStyle(.ultraThinMaterial)
                                    .frame(height: 30)
                                    .frame(width: textWidth(for: labels2[index]) + 40) // Add padding to the width
                                
                                Text(labels2[index])
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 10) // Add padding to the text
                            }
                        }
                    }
                    .offset(x: -offset2)
                    .frame(width: geometry.size.width * 2, alignment: .leading) // Ensure the content width is enough to scroll
                    .animation(Animation.linear(duration: scrollDuration).repeatForever(autoreverses: false), value: offset2)
                    .onAppear {
                        // Calculate the total width to scroll
                        let totalWidth = (textWidth(for: labels2[0]) + 60) * CGFloat(labels2.count) * 2 + 60 * CGFloat(labels2.count - 1)
                        offset2 = totalWidth / 2 // Start scrolling from the middle to create an infinite effect
                    }
                }
                .clipped() // Ensure that content outside the view is clipped
            }
            .frame(height: 50) // Height of the second row of rectangles to match the first row
        }
    }
    
    // Function to calculate the width of the text
    private func textWidth(for text: String) -> CGFloat {
        let font = UIFont.systemFont(ofSize: 16) // Match the font size of the Text
        let attributes = [NSAttributedString.Key.font: font]
        let size = (text as NSString).size(withAttributes: attributes)
        return size.width
    }
}

struct ModalGroupView: View {
    @State private var groupsearch: String = ""
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.black, Color.clear]),
                            startPoint: .bottom,
                            endPoint: .top
                        )
                    )
                    .frame(height: 200)
                
                Rectangle()
                    .frame(height: 650)
                    .foregroundColor(.black)
            }
            .padding(.top, 190)
            
            Rectangle()
                .frame(width: 35, height: 7)
                .cornerRadius(20)
                .padding(.bottom, 725)
                .foregroundStyle(.gray)
            
            VStack(alignment: .leading) {
                TextField("Search Groups", text: $groupsearch)
                    .padding()
                    .foregroundColor(.white)
                    .frame(width: 350, height: 40)
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)
                    .padding(.top, 180)
                    .padding(.bottom, 10)
                    .padding(.horizontal, 25) 
                // Make MovingRectanglesView span the entire width of the screen
                MovingRectanglesView()
                    .frame(maxWidth: .infinity, maxHeight: 50) // Full width of the screen
                    .padding(.top, 35)
                    .padding(.bottom, 20)// Reduced padding to prevent overlap
                
                Text("Favorites")
                    .font(.system(size: 18, weight: .heavy, design: .rounded))
                    .padding(.horizontal, 25)
                HStack {
                    ZStack {
                        Circle()
                            .frame(width: 40)
                            .foregroundStyle(.thinMaterial)
                        Image(systemName: "person.2.fill")
                            .resizable()
                            .frame(width: 20, height: 15)
                            .foregroundColor(.white)
                    }
                    Text("Friends")
                    Spacer()
                    Text("304")
                }
                .padding(.horizontal, 25)
                HStack {
                    ZStack {
                        Circle()
                            .frame(width: 40)
                            .foregroundStyle(.thinMaterial)
                        Image(systemName: "globe")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                    }
                    Text("EST - Time Zone")
                    Spacer()
                    Text("2.3M")
                }
                .padding(.horizontal, 25)
                HStack {
                    ZStack {
                        Circle()
                            .frame(width: 40)
                            .foregroundStyle(.thinMaterial)
                        Image(systemName: "globe.americas.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                    }
                    Text("World")
                    Spacer()
                    Text("21M")
                }
                .padding(.horizontal, 25)
                Divider()
                    .frame(width: 350)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .padding(.horizontal, 25)
                Text("My Groups")
                    .font(.system(size: 18, weight: .heavy, design: .rounded))
                    .padding(.horizontal, 25)
                HStack {
                    ZStack {
                        Circle()
                            .frame(width: 40)
                            .foregroundStyle(.thinMaterial)
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.white)
                    }
                    Text("New Group")
                }
                .padding(.horizontal, 25)
                HStack {
                    Image(systemName: "star")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.white)
                    ZStack {
                        Circle()
                            .frame(width: 40)
                            .foregroundStyle(.thinMaterial)
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.white)
                    }
                    Text("ManBuns")
                    Spacer()
                    Text("6")
                }
                .padding(.horizontal, 25)
                HStack {
                    Image(systemName: "star")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.white)
                    ZStack {
                        Circle()
                            .frame(width: 40)
                            .foregroundStyle(.thinMaterial)
                        Image(systemName: "graduationcap")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                    }
                    Text("College of Charleston")
                    Spacer()
                    Text("1.2k")
                }
                .padding(.horizontal, 25)
                HStack {
                    Image(systemName: "star")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.white)
                    ZStack {
                        Circle()
                            .frame(width: 40)
                            .foregroundStyle(.thinMaterial)
                        Image(systemName: "building.columns.fill")
                            .resizable()
                            .frame(width: 18, height: 15)
                            .foregroundColor(.white)
                    }
                    Text("Charlotte")
                    Spacer()
                    Text("19k")
                }
                .padding(.horizontal, 25)
                Spacer()
            }
            
        }
    }
}

#Preview {
    ModalGroupView()
}
