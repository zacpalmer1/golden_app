import SwiftUI

struct Messages: View {
    @State private var activity = false
    var body: some View {
        ZStack {
            FollowGradient()
                .frame(height: 140)
                .ignoresSafeArea(edges: .top)
                .opacity(0.7)
            Rectangle()
                .frame(height: 140)
                .foregroundStyle(.ultraThinMaterial)
                .ignoresSafeArea(edges: .top) // Extends the Rectangle into the top safe area

            VStack(spacing: 5) { // Control spacing between elements
                HStack {
                    Button(action: {
                        activity.toggle()
                    }) {
                        Image(systemName: "chevron.backward")
                    }
                    .fullScreenCover(isPresented: $activity) {
                        Activity()
                        
                    }
                    
                    
                    Spacer()
                    Image("joshlarge")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipped()
                        .cornerRadius(11)
                    Spacer()
                    Image(systemName: "gear")
                }
                .padding(.horizontal, 17)
                HStack(spacing:3){
                    Text("Josh Powers")
                        .font(.system(size: 13, weight: .regular, design: .default))
                    Image(systemName: "chevron.forward")
                        .resizable()
                        .frame(width:4, height: 8)
                        .foregroundColor(.gray)
                }
            }
            .padding(.top, 50) // Adjust to position content within the Rectangle
        }
        .frame(maxHeight: .infinity, alignment: .top) // Push ZStack to top of screen
        .ignoresSafeArea(edges: .top)
        HStack{
            ZStack{
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundStyle(.ultraThinMaterial)
                Image(systemName: "plus")
                    .foregroundColor(.gray)
                    .bold()
            }
            ZStack{
                Rectangle()
                    .frame(height: 40)
                    .cornerRadius(20)
                    .foregroundStyle(.ultraThinMaterial)
                HStack{
                    Text("Message Josh Powers")
                        .font(.system(size: 15, weight: .regular, design: .default))
                        .foregroundColor(.gray)
                    Spacer()
                    Image(systemName: "mic.fill")
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 15)
            }
        }
        .padding(.horizontal, 17)
    }
}

#Preview {
    Messages()
}
