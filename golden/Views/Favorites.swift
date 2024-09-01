//
//  Favorites.swift
//  golden
//
//  Created by Zachary Palmer on 8/11/24.
//

import SwiftUI
import Combine

struct KeyboardAwareModifier: ViewModifier {
    @State private var keyboardHeight: CGFloat = 0
    
    func body(content: Content) -> some View {
        content
            .padding(.bottom, keyboardHeight)
            .onReceive(Publishers.keyboardHeight) { self.keyboardHeight = $0 }
            .animation(.easeOut(duration: 0.16))
    }
}

extension View {
    func keyboardAware() -> some View {
        self.modifier(KeyboardAwareModifier())
    }
}

extension Publishers {
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        let willShow = NotificationCenter.default
            .publisher(for: UIApplication.keyboardWillShowNotification)
            .map { $0.keyboardHeight }
        
        let willHide = NotificationCenter.default
            .publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }
        
        return MergeMany(willShow, willHide)
            .removeDuplicates()
            .eraseToAnyPublisher()
    }
}

extension Notification {
    var keyboardHeight: CGFloat {
        (userInfo?[UIApplication.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}
struct Favorites: View {
    @State private var usersearch: String = ""
    
    var body: some View {
        ZStack {
            // Background image with dynamic opacity
            Image("image4")
                .resizable()
                .frame(width: .infinity, height: .infinity)
                .ignoresSafeArea()
            
            Rectangle()
                .foregroundStyle(.ultraThinMaterial)
                .ignoresSafeArea()
            
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
                    
                    Rectangle()
                        .frame(width: .infinity, height: .infinity)
                        .foregroundColor(.black)
                }
                .padding(.top, 190)
                .ignoresSafeArea()
                
                VStack {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Search")
                            .font(.system(size: 28, weight: .heavy, design: .rounded))
                            .padding(.top, 25)
                        TextField("Find Friends", text: $usersearch)
                            .padding()
                            .foregroundColor(.white)
                            .frame(height: 40)
                            .background(Color.gray.opacity(0.4))
                            .cornerRadius(10)
                        
                        Text("Recent")
                            .font(.system(size: 22, weight: .heavy, design: .rounded))
                        
                        HStack {
                                                    Image("profile")
                                                        .resizable()
                                                        .frame(width: 40, height: 40)
                                                        .foregroundColor(.white)
                                                    Text("Josh Powers")
                                                    Spacer()
                                                    Text("34")
                                                }
                                                
                                                HStack {
                                                    Image("profile")
                                                        .resizable()
                                                        .frame(width: 40, height: 40)
                                                        .foregroundColor(.white)
                                                    Text("Davis Cooney")
                                                    Spacer()
                                                    Text("13")
                                                }
                                                
                                                HStack {
                                                    Image("profile")
                                                        .resizable()
                                                        .frame(width: 40, height: 40)
                                                        .foregroundColor(.white)
                                                    Text("Lee Eberly")
                                                    Spacer()
                                                    Text("21")
                                                }
                                                
                                                Divider() // Remove fixed width
                                                
                                                Text("Suggested")
                                                    .font(.system(size: 22, weight: .heavy, design: .rounded))
                                                
                                                HStack {
                                                    Image("profile")
                                                        .resizable()
                                                        .frame(width: 40, height: 40)
                                                        .foregroundColor(.white)
                                                    
                                                    Text("Jack Malo")
                                                    Spacer()
                                                    Text("6")
                                                }
                                                
                                                HStack {
                                                    Image("profile")
                                                        .resizable()
                                                        .frame(width: 40, height: 40)
                                                        .foregroundColor(.white)
                                                    Text("Kanye West")
                                                    Spacer()
                                                    Text("1.2k")
                                                }
                                                
                                                HStack {
                                                    Image("profile")
                                                        .resizable()
                                                        .frame(width: 40, height: 40)
                                                        .foregroundColor(.white)
                                                    Text("Emma Chamberland")
                                                    Spacer()
                                                    Text("19k")
                                                }
                        Divider() // Remove fixed width
                        
                        Text("Trending")
                            .font(.system(size: 22, weight: .heavy, design: .rounded))
                        
                        HStack {
                            Image("profile")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                            
                            Text("Joe Biden")
                            Spacer()
                            Text("22k")
                        }
                        
                        HStack {
                            Image("profile")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                            Text("Zendaya")
                            Spacer()
                            Text("18k")
                        }
                        
                        HStack {
                            Image("profile")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                            Text("Leo Dicaprio")
                            Spacer()
                            Text("16k")
                        }
                                                Spacer()
                                            }
                                            .padding(.top, 10)
                                            .frame(maxWidth: .infinity) // Allow VStack to take up available width
                                        }
                                        .padding(.horizontal, 25) // Add margin on both sides, allowing for more padding
                                    

                        
                    
                    .frame(maxWidth: .infinity)
                
                
                .keyboardAware() // Apply the custom modifier here
            }
        }
    }
}

#Preview {
    Favorites()
}

