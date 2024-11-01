import SwiftUI


struct GradientGroupView: View {
    @State private var groupsearch: String = ""
    @State private var showMeshGradient = false
    @ObservedObject var colorSelection: ColorSelection
    
    // Define your colors
    let desert: [Color] = [Color(hex: "#F7DBA7"), Color(hex: "#1E2D2F"), Color(hex: "#C57B57")]
    let ocean: [Color] = [Color(hex: "#3B28CC"), Color(hex: "#87BFFF"), Color(hex: "#3F8EFC")]
    let fire: [Color] = [Color(hex: "#FF3C38"), Color(hex: "#8F0200"), Color(hex: "#FF8C42")]

    var body: some View {
        
            ZStack {
                // Background image with dynamic opacity
                MessagesGradient(colorSelection: colorSelection, show: showMeshGradient)
                Rectangle()
                    .foregroundStyle(.ultraThinMaterial)
                    .ignoresSafeArea()
                
                ZStack(alignment: .top) { // Aligns content to the top
                    VStack(spacing: 0) {
                        Rectangle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.black, Color.clear]),
                                    startPoint: .bottom,
                                    endPoint: .top
                                )
                            )
                            .frame(height: .infinity) // Set height for the gradient Rectangle
                        
                        Rectangle()
                            .frame(height: 350) // Set height for the black Rectangle
                            .foregroundColor(.black)
                    }
                    .ignoresSafeArea() // Ensures the rectangles extend to the edges
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
                                .frame(height: 350) // Fill the remaining screen
                                .foregroundColor(.black)
                        }
                        .padding(.top, 190)
                        
                        
                        
                        VStack{
                            Rectangle()
                                .frame(width: 30, height: 5)
                                .cornerRadius(20)
                                .padding(.top, 10)
                                .foregroundStyle(.gray)
                            TextField("Search Groups", text: $groupsearch)
                                .padding()
                                .foregroundColor(.white)
                                .frame(width: 350, height: 40)
                                .background(Color.gray.opacity(0.4))
                                .cornerRadius(10)
                                .padding(.horizontal, 25)
                                .padding(.top, 10)
                            
                            // Vertical ScrollView for colors
                            ScrollView(.vertical, showsIndicators: false) {
                                
                                VStack(alignment:.leading, spacing: 10) {
                                    
                                        Text("Enviroment")
                                            .font(.system(size: 22, weight: .heavy, design: .rounded))
                                            .padding(.bottom, 10)
                                    
                                    HStack{
                                        Button(action: {
                                            let newColors: [Color] = desert // Example new colors
                                            colorSelection.updateColors(newColors: newColors)
                                        }) {
                                            ZStack {
                                                Rectangle()
                                                    .fill(LinearGradient(gradient: Gradient(colors: desert), startPoint: .topLeading, endPoint: .bottomTrailing))
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    
                                                    .shadow(radius: 10)
                                                Rectangle()
                                                    
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    .foregroundStyle(.ultraThinMaterial)
                                                    .shadow(radius: 10)
                                                Text("Desert")
                                                    .font(.system(size: 20, weight: .medium, design: .rounded))
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        Button(action: {
                                            let newColors: [Color] = ocean // Example new colors
                                            colorSelection.updateColors(newColors: newColors)
                                        }) {
                                            ZStack {
                                                Rectangle()
                                                    .fill(LinearGradient(gradient: Gradient(colors: ocean), startPoint: .topLeading, endPoint: .bottomTrailing))
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    
                                                    .shadow(radius: 10)
                                                Rectangle()
                                                    
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    .foregroundStyle(.ultraThinMaterial)
                                                    .shadow(radius: 10)
                                                Text("Ocean")
                                                    .font(.system(size: 20, weight: .medium, design: .rounded))
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        Button(action: {
                                            let newColors: [Color] = fire // Example new colors
                                            colorSelection.updateColors(newColors: newColors)
                                        }) {
                                            ZStack {
                                                Rectangle()
                                                    .fill(LinearGradient(gradient: Gradient(colors: fire), startPoint: .topLeading, endPoint: .bottomTrailing))
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    
                                                    .shadow(radius: 10)
                                                Rectangle()
                                                    
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    .foregroundStyle(.ultraThinMaterial)
                                                    .shadow(radius: 10)
                                                Text("Fire")
                                                    .font(.system(size: 20, weight: .medium, design: .rounded))
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        
                                    }
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    HStack{
                                        Button(action: {
                                            let newColors: [Color] = pink // Example new colors
                                            colorSelection.updateColors(newColors: newColors)
                                        }) {
                                            ZStack {
                                                Rectangle()
                                                    .fill(LinearGradient(gradient: Gradient(colors: pink), startPoint: .topLeading, endPoint: .bottomTrailing))
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    
                                                    .shadow(radius: 10)
                                                Rectangle()
                                                    
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    .foregroundStyle(.ultraThinMaterial)
                                                    .shadow(radius: 10)
                                                Text("Pink")
                                                    .font(.system(size: 20, weight: .medium, design: .rounded))
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        Button(action: {
                                            let newColors: [Color] = forest // Example new colors
                                            colorSelection.updateColors(newColors: newColors)
                                        }) {
                                            ZStack {
                                                Rectangle()
                                                    .fill(LinearGradient(gradient: Gradient(colors: forest), startPoint: .topLeading, endPoint: .bottomTrailing))
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    
                                                    .shadow(radius: 10)
                                                Rectangle()
                                                    
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    .foregroundStyle(.ultraThinMaterial)
                                                    .shadow(radius: 10)
                                                Text("Forest")
                                                    .font(.system(size: 20, weight: .medium, design: .rounded))
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        Button(action: {
                                            let newColors: [Color] = fall // Example new colors
                                            colorSelection.updateColors(newColors: newColors)
                                        }) {
                                            ZStack {
                                                Rectangle()
                                                    .fill(LinearGradient(gradient: Gradient(colors: fall), startPoint: .topLeading, endPoint: .bottomTrailing))
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    
                                                    .shadow(radius: 10)
                                                Rectangle()
                                                    
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    .foregroundStyle(.ultraThinMaterial)
                                                    .shadow(radius: 10)
                                                Text("Fall")
                                                    .font(.system(size: 20, weight: .medium, design: .rounded))
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        
                                    }
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    HStack{
                                        Button(action: {
                                            let newColors: [Color] = cyber // Example new colors
                                            colorSelection.updateColors(newColors: newColors)
                                        }) {
                                            ZStack {
                                                Rectangle()
                                                    .fill(LinearGradient(gradient: Gradient(colors: cyber), startPoint: .topLeading, endPoint: .bottomTrailing))
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    
                                                    .shadow(radius: 10)
                                                Rectangle()
                                                    
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    .foregroundStyle(.ultraThinMaterial)
                                                    .shadow(radius: 10)
                                                Text("Cyber")
                                                    .font(.system(size: 20, weight: .medium, design: .rounded))
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        Button(action: {
                                            let newColors: [Color] = blackAndWhite // Example new colors
                                            colorSelection.updateColors(newColors: newColors)
                                        }) {
                                            ZStack {
                                                Rectangle()
                                                    .fill(LinearGradient(gradient: Gradient(colors: blackAndWhite), startPoint: .topLeading, endPoint: .bottomTrailing))
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    
                                                    .shadow(radius: 10)
                                                Rectangle()
                                                    
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    .foregroundStyle(.ultraThinMaterial)
                                                    .shadow(radius: 10)
                                                Text("B&W")
                                                    .font(.system(size: 20, weight: .medium, design: .rounded))
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        Button(action: {
                                            let newColors: [Color] = amber // Example new colors
                                            colorSelection.updateColors(newColors: newColors)
                                        }) {
                                            ZStack {
                                                Rectangle()
                                                    .fill(LinearGradient(gradient: Gradient(colors: amber), startPoint: .topLeading, endPoint: .bottomTrailing))
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    
                                                    .shadow(radius: 10)
                                                Rectangle()
                                                    
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    .foregroundStyle(.ultraThinMaterial)
                                                    .shadow(radius: 10)
                                                Text("Amber")
                                                    .font(.system(size: 20, weight: .medium, design: .rounded))
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        
                                    }
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    HStack{
                                        Button(action: {
                                            let newColors: [Color] = earthy // Example new colors
                                            colorSelection.updateColors(newColors: newColors)
                                        }) {
                                            ZStack {
                                                Rectangle()
                                                    .fill(LinearGradient(gradient: Gradient(colors: earthy), startPoint: .topLeading, endPoint: .bottomTrailing))
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    
                                                    .shadow(radius: 10)
                                                Rectangle()
                                                    
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    .foregroundStyle(.ultraThinMaterial)
                                                    .shadow(radius: 10)
                                                Text("Earthy")
                                                    .font(.system(size: 20, weight: .medium, design: .rounded))
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        Button(action: {
                                            let newColors: [Color] = cottoncandy // Example new colors
                                            colorSelection.updateColors(newColors: newColors)
                                        }) {
                                            ZStack {
                                                Rectangle()
                                                    .fill(LinearGradient(gradient: Gradient(colors: cottoncandy), startPoint: .topLeading, endPoint: .bottomTrailing))
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    
                                                    .shadow(radius: 10)
                                                Rectangle()
                                                    
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    .foregroundStyle(.ultraThinMaterial)
                                                    .shadow(radius: 10)
                                                Text("Cotton Candy")
                                                    .font(.system(size: 20, weight: .medium, design: .rounded))
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        Button(action: {
                                            let newColors: [Color] = bluehour // Example new colors
                                            colorSelection.updateColors(newColors: newColors)
                                        }) {
                                            ZStack {
                                                Rectangle()
                                                    .fill(LinearGradient(gradient: Gradient(colors: bluehour), startPoint: .topLeading, endPoint: .bottomTrailing))
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    
                                                    .shadow(radius: 10)
                                                Rectangle()
                                                    
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    .foregroundStyle(.ultraThinMaterial)
                                                    .shadow(radius: 10)
                                                Text("Blue Hour")
                                                    .font(.system(size: 20, weight: .medium, design: .rounded))
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        
                                    }
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    HStack{
                                        Button(action: {
                                            let newColors: [Color] = burnt // Example new colors
                                            colorSelection.updateColors(newColors: newColors)
                                        }) {
                                            ZStack {
                                                Rectangle()
                                                    .fill(LinearGradient(gradient: Gradient(colors: burnt), startPoint: .topLeading, endPoint: .bottomTrailing))
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    
                                                    .shadow(radius: 10)
                                                Rectangle()
                                                    
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    .foregroundStyle(.ultraThinMaterial)
                                                    .shadow(radius: 10)
                                                Text("Burnt")
                                                    .font(.system(size: 20, weight: .medium, design: .rounded))
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        Button(action: {
                                            let newColors: [Color] = lime // Example new colors
                                            colorSelection.updateColors(newColors: newColors)
                                        }) {
                                            ZStack {
                                                Rectangle()
                                                    .fill(LinearGradient(gradient: Gradient(colors: lime), startPoint: .topLeading, endPoint: .bottomTrailing))
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    
                                                    .shadow(radius: 10)
                                                Rectangle()
                                                    
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    .foregroundStyle(.ultraThinMaterial)
                                                    .shadow(radius: 10)
                                                Text("Lime")
                                                    .font(.system(size: 20, weight: .medium, design: .rounded))
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        Button(action: {
                                            let newColors: [Color] = purple // Example new colors
                                            colorSelection.updateColors(newColors: newColors)
                                        }) {
                                            ZStack {
                                                Rectangle()
                                                    .fill(LinearGradient(gradient: Gradient(colors: purple), startPoint: .topLeading, endPoint: .bottomTrailing))
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    
                                                    .shadow(radius: 10)
                                                Rectangle()
                                                    
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    .foregroundStyle(.ultraThinMaterial)
                                                    .shadow(radius: 10)
                                                Text("Purple")
                                                    .font(.system(size: 20, weight: .medium, design: .rounded))
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        
                                    }
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    HStack{
                                        Button(action: {
                                            let newColors: [Color] = easter // Example new colors
                                            colorSelection.updateColors(newColors: newColors)
                                        }) {
                                            ZStack {
                                                Rectangle()
                                                    .fill(LinearGradient(gradient: Gradient(colors: easter), startPoint: .topLeading, endPoint: .bottomTrailing))
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    
                                                    .shadow(radius: 10)
                                                Rectangle()
                                                    
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    .foregroundStyle(.ultraThinMaterial)
                                                    .shadow(radius: 10)
                                                Text("Easter")
                                                    .font(.system(size: 20, weight: .medium, design: .rounded))
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        Button(action: {
                                            let newColors: [Color] = beach // Example new colors
                                            colorSelection.updateColors(newColors: newColors)
                                        }) {
                                            ZStack {
                                                Rectangle()
                                                    .fill(LinearGradient(gradient: Gradient(colors: beach), startPoint: .topLeading, endPoint: .bottomTrailing))
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    
                                                    .shadow(radius: 10)
                                                Rectangle()
                                                    
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    .foregroundStyle(.ultraThinMaterial)
                                                    .shadow(radius: 10)
                                                Text("Beach")
                                                    .font(.system(size: 20, weight: .medium, design: .rounded))
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        Button(action: {
                                            let newColors: [Color] = racecar // Example new colors
                                            colorSelection.updateColors(newColors: newColors)
                                        }) {
                                            ZStack {
                                                Rectangle()
                                                    .fill(LinearGradient(gradient: Gradient(colors: racecar), startPoint: .topLeading, endPoint: .bottomTrailing))
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    
                                                    .shadow(radius: 10)
                                                Rectangle()
                                                    
                                                    .frame(width: 110, height: 100)
                                                    .cornerRadius(20)
                                                    .foregroundStyle(.ultraThinMaterial)
                                                    .shadow(radius: 10)
                                                Text("Racecar")
                                                    .font(.system(size: 20, weight: .medium, design: .rounded))
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        
                                    }
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    Divider()
                                        .padding(.bottom, 15)
                                        .padding(.top, 15)
                                    Text("Countries")
                                        .font(.system(size: 22, weight: .heavy, design: .rounded))
                                    VStack {
                                        // Your button
                                        HStack{
                                            Button(action: {
                                                let newColors: [Color] = usa // Example new colors
                                                colorSelection.updateColors(newColors: newColors)
                                            }) {
                                                ZStack {
                                                    Rectangle()
                                                        .fill(LinearGradient(gradient: Gradient(colors: usa), startPoint: .topLeading, endPoint: .bottomTrailing))
                                                        .frame(width: 110, height: 100)
                                                        .cornerRadius(20)
                                                        
                                                        .shadow(radius: 10)
                                                    Rectangle()
                                                        
                                                        .frame(width: 110, height: 100)
                                                        .cornerRadius(20)
                                                        .foregroundStyle(.ultraThinMaterial)
                                                        .shadow(radius: 10)
                                                    Text("United States")
                                                        .font(.system(size: 20, weight: .medium, design: .rounded))
                                                        .foregroundColor(.white)
                                                }
                                            }
                                            Button(action: {
                                                let newColors: [Color] = canada // Example new colors
                                                colorSelection.updateColors(newColors: newColors)
                                            }) {
                                                ZStack {
                                                    Rectangle()
                                                        .fill(LinearGradient(gradient: Gradient(colors: canada), startPoint: .topLeading, endPoint: .bottomTrailing))
                                                        .frame(width: 110, height: 100)
                                                        .cornerRadius(20)
                                                        
                                                        .shadow(radius: 10)
                                                    Rectangle()
                                                        
                                                        .frame(width: 110, height: 100)
                                                        .cornerRadius(20)
                                                        .foregroundStyle(.ultraThinMaterial)
                                                        .shadow(radius: 10)
                                                    Text("Canada")
                                                        .font(.system(size: 20, weight: .medium, design: .rounded))
                                                        .foregroundColor(.white)
                                                }
                                            }
                                            Button(action: {
                                                let newColors: [Color] = mexico // Example new colors
                                                colorSelection.updateColors(newColors: newColors)
                                            }) {
                                                ZStack {
                                                    Rectangle()
                                                        .fill(LinearGradient(gradient: Gradient(colors: mexico), startPoint: .topLeading, endPoint: .bottomTrailing))
                                                        .frame(width: 110, height: 100)
                                                        .cornerRadius(20)
                                                        
                                                        .shadow(radius: 10)
                                                    Rectangle()
                                                        
                                                        .frame(width: 110, height: 100)
                                                        .cornerRadius(20)
                                                        .foregroundStyle(.ultraThinMaterial)
                                                        .shadow(radius: 10)
                                                    Text("Mexico")
                                                        .font(.system(size: 20, weight: .medium, design: .rounded))
                                                        .foregroundColor(.white)
                                                }
                                            }
                                            
                                        }
                                        .frame(maxWidth: .infinity, alignment: .center)
                                    }
                                }
                                .padding(.horizontal, 25)
                                .padding(.top, 10)
                                .padding(.bottom, 30)
                            }
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                    }
                    
                }
                
                .edgesIgnoringSafeArea(.all) // Make sure the layout uses the entire screen space
            }
        }
    
}

// View to display colors as circles in a horizontal stack
struct ColorRowView: View {
    let title: String
    let colors: [Color]
    
    var body: some View {
        HStack(spacing:0) {
            
            Text(title)
                .foregroundColor(.white)
                
                .frame(maxWidth: .infinity, alignment: .leading) // Align title to the left
            
            HStack(spacing: 15) {
                ForEach(colors, id: \.self) { color in
                    Circle()
                        .fill(color)
                        .frame(width: 25, height: 50) // Size of the circles
                }
            }
            .frame(maxWidth: .infinity, alignment: .trailing) // Align circles to the right
        }
        
    }
}

struct FlagView: View {
    let colors: [Color]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(colors, id: \.self) { color in
                Rectangle()
                    .fill(color)
            }
        }
    }
}

