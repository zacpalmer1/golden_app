import SwiftUI

struct SignUp1: View {
    @State private var showingModal = false
    @State private var phonenumber: String = ""
    
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
                        
                        Text("Step 1 of 5")
                            .font(.system(size: 13, weight: .regular, design: .rounded))
                            .frame(maxWidth: .infinity, alignment: .center) // Center text
                            .offset(y:35)
                        Spacer()
                        
                        VStack(alignment: .center) { // Center non-text elements
                            Text("Country")
                                .font(.system(size: 18, weight: .heavy, design: .rounded))
                                .frame(maxWidth: .infinity, alignment: .leading) // Align text to the left
                            
                            Button(action: {
                                showingModal = true // Show the modal when the button is tapped
                            }) {
                                Text("+1  |  United States")
                                    .padding(.leading, 16) // Add padding to the leading edge
                                    .frame(width: 330, height: 50, alignment: .leading)
                                    .background(Color.gray.opacity(0.4))
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .padding(.bottom)
                                
                            }
                            .sheet(isPresented: $showingModal) {
                                ModalView() // The view to be presented in the modal
                            }
                            
                            Text("Phone Number")
                                .font(.system(size: 18, weight: .heavy, design: .rounded))
                                .frame(maxWidth: .infinity, alignment: .leading) // Align text to the left
                            
                            TextField("Phone Number", text: $phonenumber)
                                .padding()
                                .foregroundColor(.white)
                                .frame(width: 330, height: 50) // Set the height of the text box
                                .background(Color.gray.opacity(0.4)) // Light gray background
                                .cornerRadius(10) // Rounded corners
                            
                            Text("We'll send an SMS verification code. By entering your number, you agree to receive transactional messaging by SMS or other message channels about your account.")
                                .font(.system(size: 12, weight: .regular, design: .rounded))
                                .frame(maxWidth: .infinity, alignment: .leading) // Align text container to the left
                                .multilineTextAlignment(.leading) // Align multiline text to the left
                                .padding([.leading, .trailing], 1)
                                .padding(.bottom)
                                .padding(.top)
                            Button(action: {
                                // Add your action here
                            }) {
                                Text("Use email instead")
                                    .foregroundColor(.orange)
                                    .font(.system(size: 14))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.bottom)
                            }
                            
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
                        
                    }
                    
                    .padding() // Add padding around the entire VStack
                    
                }
            }
    }
    
}

struct ModalView: View {
    var body: some View {
        VStack {
            Text("This is a modal view")
                .font(.largeTitle)
                .padding()

            Button(action: {
                // Action to dismiss the modal
                // You can add functionality here if needed
            }) {
                Text("Dismiss")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

#Preview {
    SignUp1()
}
