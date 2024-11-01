import SwiftUI

struct ProfileRecent: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 0){
                Text("Favorites")
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .padding(.horizontal, 0)
                    .padding(.trailing, 6)
                Image(systemName: "chevron.right")
                    .bold()
                    .foregroundColor(.gray)
                
                
            }
            HStack(alignment: .top) {
                VStack(spacing:7){
                    Image("test3")
                        .resizable() // Keep this to enable resizing
                        .scaledToFill() // Use this to maintain the aspect ratio
                        .frame(width: 175, height: 350)
                        .cornerRadius(19)
                    ZStack {
                        DaytimeGradient2(colors: card)
                            .frame(width: 175, height: 175)
                            .cornerRadius(19)
                        
                        Text("Went to the Art Loeb with a few friends for Sunset :)")
                            .font(.system(size: 24, weight: .heavy, design: .rounded))
                            .foregroundColor(.white) // Set text color to make it visible against the gradient
                            .multilineTextAlignment(.leading) // Center the text alignment
                            .frame(width:140) // Make the text frame take full width
                        
                        
                        
                        
                    }
                    Image("test4")
                        .resizable() // Keep this to enable resizing
                        .scaledToFill() // Use this to maintain the aspect ratio
                        .frame(width: 175, height: 350)
                        .cornerRadius(19)
                    ZStack {
                        DaytimeGradient2(colors: card3)
                            .frame(width: 175, height: 175)
                            .cornerRadius(19)
                        
                        Text("My last hike of the month, my legs are done!")
                            .font(.system(size: 24, weight: .heavy, design: .rounded))
                            .foregroundColor(.white) // Set text color to make it visible against the gradient
                            .multilineTextAlignment(.leading) // Center the text alignment
                            .frame(width:140) // Make the text frame take full width
                    }
                }
                VStack(spacing:7){
                    ZStack {
                        DaytimeGradient2(colors: card2)
                            .frame(width: 175, height: 175)
                            .cornerRadius(19)
                        
                        Text("Sedona with the guys, getting in trailing")
                            .font(.system(size: 24, weight: .heavy, design: .rounded))
                            .foregroundColor(.white) // Set text color to make it visible against the gradient
                            .multilineTextAlignment(.leading) // Center the text alignment
                            .frame(width:140) // Make the text frame take full width
                        
                    }
                    Image("test5")
                        .resizable() // Keep this to enable resizing
                        .scaledToFill() // Use this to maintain the aspect ratio
                        .frame(width: 175, height: 350)
                        .cornerRadius(19)
                    ZStack {
                        DaytimeGradient2(colors: card4)
                            .frame(width: 175, height: 175)
                            .cornerRadius(19)
                        
                        Text("Thank you to the Smith family, fun weekend")
                            .font(.system(size: 24, weight: .heavy, design: .rounded))
                            .foregroundColor(.white) // Set text color to make it visible against the gradient
                            .multilineTextAlignment(.leading) // Center the text alignment
                            .frame(width:140) // Make the text frame take full width
                        
                    }
                    Image("test6")
                        .resizable() // Keep this to enable resizing
                        .scaledToFill() // Use this to maintain the aspect ratio
                        .frame(width: 175, height: 350)
                        .cornerRadius(19)
                    
                }
                
            }
            ZStack{
                DaytimeGradient()
                    .frame(height: 135)
                    .cornerRadius(19)
                    
                Rectangle()
                    .frame(height: 135)
                    .cornerRadius(19)
                    .foregroundStyle(.ultraThinMaterial)
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width:30, height: 30)
                    .foregroundColor(.white)
            }
            Spacer() // This will push everything to the top
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Make VStack take full space
        .padding(.top, 0) // Remove any padding at the top if needed
        .ignoresSafeArea()
        
    }
        
}

#Preview {
    ProfileRecent()
}
