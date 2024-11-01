import SwiftUI

struct SignUp4: View {
    @State private var showingModal = false
    @StateObject private var viewModel = RegistrationViewModel()
    @StateObject private var colorSelection = ColorSelection()
    @State private var showMeshGradient = false
    var body: some View {
        NavigationStack {
            
            ZStack(alignment: .top) {
                
                // Background image with dynamic opacity
                MessagesGradient(colorSelection: colorSelection, show: showMeshGradient)
                Rectangle()
                    .foregroundStyle(.ultraThinMaterial)
                    .ignoresSafeArea()
                
                ZStack { // Aligns content to the top
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
                    .ignoresSafeArea()
                    
                        
                        VStack(alignment: .leading) { // Align text to the leading edge
                            Text("Create Account")
                                .font(.system(size: 18, weight: .heavy, design: .rounded))
                                .frame(maxWidth: .infinity, alignment: .center) // Center text
                                .padding(.bottom, 5)
                            
                            Text("Step 3 of 5")
                                .font(.system(size: 13, weight: .regular, design: .rounded))
                                .frame(maxWidth: .infinity, alignment: .center) // Center text
                                
                            
                            
                            
                            VStack(alignment: .center) { // Center non-text elements
                                Text("Age")
                                    .font(.system(size: 18, weight: .heavy, design: .rounded))
                                    .frame(maxWidth: .infinity, alignment: .leading) // Align text to the left
                                
                                TextField("How old are you?", text: $viewModel.age)
                                    .padding()
                                    .foregroundColor(.white)
                                    .frame(width: 330, height: 50) // Set the height of the text box
                                    .background(Color.gray.opacity(0.4)) // Light gray background
                                    .cornerRadius(10) // Rounded corners
                                    .padding(.bottom)
                                Text("Gender")
                                    .font(.system(size: 18, weight: .heavy, design: .rounded))
                                    .frame(maxWidth: .infinity, alignment: .leading) // Align text to the left
                                
                                TextField("What's your gender?", text: $viewModel.gender)
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
                                
                                
                                NavigationLink(destination: SignUp5().navigationBarBackButtonHidden(true)) { // Navigate to SignUp2
                                    Text("Continue")
                                        .frame(width: 330, height: 50)
                                        .background(Color.orange)
                                        .foregroundColor(.white)
                                        .cornerRadius(40)
                                        .padding(.bottom, 10)
                                    
                                }
                                NavigationLink(destination: SignUp2().navigationBarBackButtonHidden(true)) { // Navigate to SignUp2
                                    Text("Back to Step 2")
                                        .foregroundColor(.orange)
                                        .font(.system(size: 12))
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
                }
        }
    }
}


#Preview {
    SignUp4()
}
