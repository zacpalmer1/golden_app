import SwiftUI

struct SignUp2: View {
    @State private var showingModal = false
    @State private var firstname: String = ""
    @State private var lastname: String = ""

    var body: some View {
        ZStack {
            // Background image with dynamic opacity
            
            Image("image3")
                .resizable()
                .frame(width: .infinity, height: .infinity)
            
                .ignoresSafeArea()
            
            Rectangle()
                .foregroundStyle(.ultraThinMaterial)
                .ignoresSafeArea()
            
            
            ZStack{
                VStack(spacing: 0){
                    Rectangle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.black, Color.clear]), // Gradient from black to clear
                                startPoint: .bottom, // Gradient starts at the bottom
                                endPoint: .top // Gradient ends at the top
                            )
                        )
                        .frame(width: .infinity, height: 200)
                    
                    Rectangle()
                        .frame(width: .infinity, height: 650)
                        .foregroundColor(.black)
                }
                
                VStack(alignment: .leading) { // Align text to the leading edge
                    Text("Create Account")
                        .font(.system(size: 18, weight: .heavy, design: .rounded))
                        .frame(maxWidth: .infinity, alignment: .center) // Center text
                        .offset(y:30)
                    
                    Text("Step 2 of 5")
                        .font(.system(size: 13, weight: .regular, design: .rounded))
                        .frame(maxWidth: .infinity, alignment: .center) // Center text
                        .offset(y:35)
                    
                    Spacer()
                    
                    VStack(alignment: .center) { // Center non-text elements
                        Text("First Name")
                            .font(.system(size: 18, weight: .heavy, design: .rounded))
                            .frame(maxWidth: .infinity, alignment: .leading) // Align text to the left
                        
                        TextField("First Name", text: $firstname)
                            .padding()
                            .foregroundColor(.white)
                            .frame(width: 330, height: 50) // Set the height of the text box
                            .background(Color.gray.opacity(0.4)) // Light gray background
                            .cornerRadius(10) // Rounded corners
                            .padding(.bottom)
                        Text("Last Name")
                            .font(.system(size: 18, weight: .heavy, design: .rounded))
                            .frame(maxWidth: .infinity, alignment: .leading) // Align text to the left
                        
                        TextField("Last Name (optional)", text: $lastname)
                            .padding()
                            .foregroundColor(.white)
                            .frame(width: 330, height: 50) // Set the height of the text box
                            .background(Color.gray.opacity(0.4)) // Light gray background
                            .cornerRadius(10) // Rounded corners
                        
                        Text("By tapping Continue, you acknowledge that you have read the Privacy Policy and agree to the Terms of Service")
                            .font(.system(size: 12, weight: .regular, design: .rounded))
                            .frame(maxWidth: .infinity, alignment: .leading) // Align text container to the left
                            .multilineTextAlignment(.leading) // Align multiline text to the left
                            .padding([.leading, .trailing], 1)
                            .padding(.bottom)
                            .padding(.top)
                        
                        
                        Button(action: {
                            print("Button tapped!")
                            // Add your action here
                        }) {
                            Text("Continue")
                                .frame(width: 330, height: 50) // Set the button's frame size
                                .background(Color.orange) // Set the button's background color
                                .foregroundColor(.white) // Set the text color
                                .cornerRadius(40) // Round the corners
                        }
                    }
                    .padding()
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                .padding() // Add padding around the entire VStack
            }
        }}
}


#Preview {
    SignUp2()
}
