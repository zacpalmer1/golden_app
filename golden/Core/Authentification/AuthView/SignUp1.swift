import SwiftUI

struct SignUp1: View {
    @State private var showingModal = false
    @State private var phonenumber: String = ""
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
                    
                    VStack(alignment: .leading) {
                        Text("Create Account")
                            .font(.system(size: 18, weight: .heavy, design: .rounded))
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.bottom, 5)
                        
                        Text("Step 1 of 5")
                            .font(.system(size: 13, weight: .regular, design: .rounded))
                            .frame(maxWidth: .infinity, alignment: .center)
                            
                        
                        
                        VStack(alignment: .center) {
                            Text("Country")
                                .font(.system(size: 18, weight: .heavy, design: .rounded))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Button(action: {
                                showingModal = true
                            }) {
                                Text("+1  |  United States")
                                    .padding(.leading, 16)
                                    .frame(width: 330, height: 50, alignment: .leading)
                                    .background(Color.gray.opacity(0.4))
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .padding(.bottom)
                                
                            }
                            .sheet(isPresented: $showingModal) {
                                ModalGroupView()
                            }
                            
                            Text("Phone Number")
                                .font(.system(size: 18, weight: .heavy, design: .rounded))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("Phone Number", text: $viewModel.phone)
                                .padding()
                                .foregroundColor(.white)
                                .frame(width: 330, height: 50)
                                .background(Color.gray.opacity(0.4))
                                .cornerRadius(10)
                            
                            Text("We'll send an SMS verification code. By entering your number, you agree to receive transactional messaging by SMS or other message channels about your account.")
                                .font(.system(size: 12, weight: .regular, design: .rounded))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
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
                            
                            NavigationLink(destination: SignUp2().navigationBarBackButtonHidden(true)) { // Navigate to SignUp2
                                Text("Continue")
                                    .frame(width: 330, height: 50)
                                    .background(Color.orange)
                                    .foregroundColor(.white)
                                    .cornerRadius(40)
                                    .padding(.bottom, 10)
                                
                            }
                            NavigationLink(destination: LogIn().navigationBarBackButtonHidden(true)) { // Navigate to SignUp2
                                Text("Back to Login")
                                    .foregroundColor(.orange)
                                    .font(.system(size: 12))
                            }
                            .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
                            
                            
                        }
                        
                        .padding()
                        
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
    SignUp1()
}
