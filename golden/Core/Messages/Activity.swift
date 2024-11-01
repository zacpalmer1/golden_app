import SwiftUI
let usermessage = [
    (image: "joshlarge", name: "Josh Powers", time: "12:49 PM", text: "Hey! Just wanted to check in and see how things are going with you. "),
    (image: "kennlarge", name: "Kennedy Seigler", time: "3:12 PM", text: "It’s been a minute. Are you free this weekend to hang out or grab a coffee?"),
    (image: "zaclarge", name: "Zac Palmer", time: "8:32 PM", text: "Got a bit of news! Let me know when you’re free to chat – nothing urgent."),
    (image: "blakelarge", name: "Blake Gillian", time: "Yesterday", text: "I just saw something that totally reminded me of you 😂 I’ll send it your way!")
    
]

struct Activity: View {
    @State private var usersearch: String = ""
    @State private var profile = false
    @State private var isPressed = false
    @StateObject private var colorSelection = ColorSelection()
    @State private var showMeshGradient = false
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack {
            // Background image with dynamic opacity
            
            ZStack(alignment: .top) { // Aligns content to the top
                // Ensures the rectangles extend to the edges
            
                VStack {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack{
                            Text("Connect")
                                .font(.system(size: 30, weight: .heavy, design: .default))
                           
                                
                        }
                        .padding(.horizontal, 10)
                        .padding(.horizontal, 7)
                        ZStack{
                            HStack {
                                Image(systemName: "magnifyingglass") // Use system name or custom image
                                    .foregroundColor(.gray)
                                    .frame(height: 0)
                                
                                TextField("Find Messages", text: $usersearch)
                                    .font(.system(size: 16, weight: .regular, design: .default))
                                
                                    .frame(height: 35)
                                
                            }
                            .padding(.horizontal, 7)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .padding(.bottom, 10)
                        }
                        .padding(.horizontal, 7)
                        .padding(.horizontal, 10)
                        // Wrapping the below content in a ScrollView
                        ScrollView {
                            VStack(alignment:.leading){
                                Text("Weekly Recap")
                                    .padding(.horizontal, 10)
                                    .font(.system(size: 24, weight: .bold, design: .default))
                            ScrollView(.horizontal, showsIndicators: false){
                                
                                    HStack(spacing: 10) { // Set spacing to 0 to remove the default spacing
                                        // Suggested Users
                                        ForEach(suggestedUser, id: \.name){ suggestedUser in
                                            VStack(spacing: 0) {
                                                VStack(alignment:.center){
                                                    
                                                    ZStack{
                                                        DaytimeGradient()
                                                            .frame(width: 91, height: 91)
                                                            .cornerRadius(80)
                                                        Rectangle()
                                                            .frame(width: 86, height: 86)
                                                            .foregroundColor(colorScheme == .dark ? .black : .white)
                                                            .cornerRadius(80)
                                                        Image(suggestedUser.image)
                                                            .resizable()
                                                            .scaledToFill()
                                                            .frame(width: 80, height: 80)
                                                            .foregroundColor(.white)
                                                            .cornerRadius(80)
                                                    }
                                                    Text(suggestedUser.name)
                                                        .font(.system(size: 12, weight: .regular, design: .default))
                                                    
                                                }
                                            }
                                            .frame(maxWidth: .infinity)
                                        }
                                    }
                                    .padding(.leading, 7)
                                    .padding(.trailing, 45)
                                }
                            }
                            .padding(.leading, 10)
                            VStack(alignment: .leading, spacing: 10) {
                                HStack{
                                    Text("Messages")
                                        .padding(10)
                                        .font(.system(size: 24, weight: .bold, design: .default))
                                    Spacer()
                                    Image(systemName: "square.and.pencil")
                                        .resizable()
                                        .foregroundStyle(.gray)
                                        
                                        .frame(width: 23, height: 23)
                                }
                                    
                                        ForEach(usermessage, id: \.name){ usermessage in
                                            HStack(spacing:10){
                                                DaytimeGradient()
                                                    .frame(width: 10, height: 10)
                                                    .cornerRadius(20)
                                                    .foregroundColor(.orange)
                                                Image(usermessage.image)
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 50, height: 50)
                                                    .foregroundColor(.white)
                                                    .cornerRadius(56)
                                                VStack(alignment:.leading, spacing:3){
                                                    HStack{
                                                        Text(usermessage.name)
                                                            .font(.system(size: 16, weight: .bold, design: .default))
                                                        Spacer()
                                                        HStack(spacing: 10){
                                                            Text(usermessage.time)
                                                                .font(.system(size: 14, weight: .regular, design: .default))
                                                                .foregroundColor(.gray)
                                                            Image(systemName: "chevron.right")
                                                                
                                                                .resizable()
                                                                .frame(width: 7, height: 10)
                                                                .foregroundColor(.gray)
                                                                .bold()
                                                        }
                                                    }
                                                    Text(usermessage.text)
                                                        .font(.system(size: 14, weight: .regular, design: .default))
                                                        .foregroundColor(.gray)
                                                    
                                                }
                                               
                                            }
                                            .frame(maxWidth: .infinity)
                                            Divider()
                                                .padding(.leading, 20)
                                        }
                            
                               
                            }
                            .padding(.horizontal, 10)
                            .padding(.trailing, 7)
                            VStack(alignment: .leading, spacing: 10) {
                                        ForEach(usermessage, id: \.name){ usermessage in
                                            HStack(spacing:10){
                                                Circle()
                                                    .frame(width: 10)
                                                    .foregroundColor(colorScheme == .dark ? .black : .white)
                                                Image(usermessage.image)
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 50, height: 50)
                                                    .foregroundColor(.white)
                                                    .cornerRadius(56)
                                                VStack(alignment:.leading, spacing:3){
                                                    HStack{
                                                        Text(usermessage.name)
                                                            .font(.system(size: 16, weight: .bold, design: .default))
                                                        Spacer()
                                                        HStack(spacing: 10){
                                                            Text(usermessage.time)
                                                                .font(.system(size: 14, weight: .regular, design: .default))
                                                                .foregroundColor(.gray)
                                                            Image(systemName: "chevron.right")
                                                                
                                                                .resizable()
                                                                .frame(width: 7, height: 10)
                                                                .foregroundColor(.gray)
                                                                .bold()
                                                        }
                                                    }
                                                    Text(usermessage.text)
                                                        .font(.system(size: 14, weight: .regular, design: .default))
                                                        .foregroundColor(.gray)
                                                    
                                                }
                                               
                                            }
                                            .frame(maxWidth: .infinity)
                                            Divider()
                                        }
                            
                               
                            }
                            .padding(.horizontal, 10)
                            .padding(.trailing, 7)
                            VStack(alignment: .leading, spacing: 10) {
                                        ForEach(usermessage, id: \.name){ usermessage in
                                            HStack(spacing:10){
                                                Circle()
                                                    .frame(width: 10)
                                                    .foregroundColor(colorScheme == .dark ? .black : .white)
                                                Image(usermessage.image)
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 50, height: 50)
                                                    .foregroundColor(.white)
                                                    .cornerRadius(56)
                                                VStack(alignment:.leading, spacing:3){
                                                    HStack{
                                                        Text(usermessage.name)
                                                            .font(.system(size: 16, weight: .bold, design: .default))
                                                        Spacer()
                                                        HStack(spacing: 10){
                                                            Text(usermessage.time)
                                                                .font(.system(size: 14, weight: .regular, design: .default))
                                                                .foregroundColor(.gray)
                                                            Image(systemName: "chevron.right")
                                                                
                                                                .resizable()
                                                                .frame(width: 7, height: 10)
                                                                .foregroundColor(.gray)
                                                                .bold()
                                                        }
                                                    }
                                                    Text(usermessage.text)
                                                        .font(.system(size: 14, weight: .regular, design: .default))
                                                        .foregroundColor(.gray)
                                                    
                                                }
                                               
                                            }
                                            .frame(maxWidth: .infinity)
                                            Divider()
                                        }
                                        .padding(.horizontal, 10)
                                        .padding(.trailing, 7)
                               
                            }
                            
                             // Add margin on both sides, allowing for more padding
                        }
                        
                        
                    }
                    
                    
                    .padding(.top, 10)
                    .frame(maxWidth: .infinity) // Allow VStack to take up available width
                }
                .frame(maxWidth: .infinity)
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    Activity()
}
