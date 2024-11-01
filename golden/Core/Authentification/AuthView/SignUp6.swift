import SwiftUI

struct SignUp6: View {
    @State private var showingModal = false
    @StateObject private var viewModel = RegistrationViewModel()
    @StateObject private var colorSelection = ColorSelection()
    @State private var showMeshGradient = false
    @State private var navigateToHome = false // State to control navigation
    
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
                    
                   
                        
                        VStack(alignment: .leading) {
                            Text("Create Account")
                                .font(.system(size: 18, weight: .heavy, design: .rounded))
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.bottom, 5)
                            
                            Text("Step 5 of 5")
                                .font(.system(size: 13, weight: .regular, design: .rounded))
                                .frame(maxWidth: .infinity, alignment: .center)
                                
                            
                            
                            
                            VStack(alignment: .center) {
                                Text("Email")
                                    .font(.system(size: 18, weight: .heavy, design: .rounded))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("What's your Email?", text: $viewModel.email)
                                    .padding()
                                    .foregroundColor(.white)
                                    .frame(width: 330, height: 50)
                                    .background(Color.gray.opacity(0.4))
                                    .cornerRadius(10)
                                    .padding(.bottom)
                                
                                Text("By tapping Continue, you acknowledge that you have read the Privacy Policy and agree to the Terms of Service")
                                    .font(.system(size: 12, weight: .regular, design: .rounded))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .multilineTextAlignment(.leading)
                                    .padding([.leading, .trailing], 1)
                                    .padding(.bottom)
                                    .padding(.top)
                                
                                // NavigationLink to Home view
                                NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true), isActive: $navigateToHome) {
                                    EmptyView() // Invisible NavigationLink that is triggered programmatically
                                    
                                }
                                
                                Button(action: {
                                    Task {
                                        try await viewModel.createUser()
                                        navigateToHome = true // Trigger navigation after action is done
                                    }
                                    
                                }) {
                                    Text("Continue")
                                        .frame(width: 330, height: 50)
                                        .background(Color.orange)
                                        .foregroundColor(.white)
                                        .cornerRadius(40)
                                        .padding(.bottom, 10)
                                }
                                NavigationLink(destination: SignUp5().navigationBarBackButtonHidden(true)) { // Navigate to SignUp2
                                    Text("Back to Step 4")
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
                        .padding()
                    }
                }
        
        }
    }
}

#Preview {
    SignUp6()
}
