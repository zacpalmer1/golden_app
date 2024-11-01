import SwiftUI

struct BannerView: View {
    @State private var isCircleVisible = false
    @State private var isIconReplaced = false
    @State private var rectangleColor = Color.green

    var body: some View {
        ZStack {
            
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 110, height: 36)
                    .foregroundColor(.green)
                Text("Following")
                    .font(.system(size: 14, weight: .bold, design: .default))
            }
            .offset(y: isCircleVisible ? -370 : -419) // Move circle off-screen
            .animation(.easeInOut(duration: 0.5), value: isCircleVisible) // Faster animation duration

            Button(action: {
                // Animate down
                withAnimation(.easeInOut(duration: 0.5)) {
                    isCircleVisible.toggle() // Move circle down
                }
                
                // Schedule moving back after 2 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        isCircleVisible.toggle() // Move circle back up
                    }
                }
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(rectangleColor) // Dynamic color
                        .frame(width: 35, height: 35)
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.white) // Dynamic color
                        .frame(width: 18, height: 18)

                    Image(systemName: isIconReplaced ? "checkmark.circle.fill" : "plus.circle.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(rectangleColor)
                }
            }
            
        }
    }
}

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView()
    }
}
