//
//  Test.swift
//  golden
//
//  Created by Zachary Palmer on 9/26/24.
//

import SwiftUI
import Combine
import Combine

class MyColorSelection: ObservableObject {
    @Published var myselectedColors: [Color] = [Color(hex: "#FFFFFF")] // Default color (white)

    func myupdateColors(to mynewColors: [Color]) {
        myselectedColors = mynewColors
    }
}

struct Test: View {
    @StateObject private var mycolorSelection = MyColorSelection() // Create a StateObject

    var body: some View {
        VStack {
            MyMessagesGradient(mycolorSelection: mycolorSelection) // Pass the ColorSelection instance
                .frame(width:.infinity, height: .infinity)
                .ignoresSafeArea()

            Button(action: {
                // Update colors
                let mynewColors: [Color] = usa
                
                mycolorSelection.myupdateColors(to: mynewColors) // Update colors
            }) {
                Text("Change Colors")
                    .padding()
                    .background(Color.gray.opacity(0.5))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .padding()
    }
}

// Hex Color Extension
struct MyMessagesGradient: View {
    @State private var isAnimating = false
    @ObservedObject var mycolorSelection: MyColorSelection // Use ObservedObject to track changes

    var body: some View {
        ZStack {
            if #available(iOS 18.0, *) {
                MeshGradient(
                    width: 3,
                    height: 3,
                    points: [[0.0, 0.0], [isAnimating ? 0.1 : 0.9, 0.0], [1.0, 0.0],
                             [0.0, 0.5], [0.5, isAnimating ? 1.0 : 0.5], [1.0, 0.5],
                             [0.0, 1.0], [0.5, 1.0], [1.0, 1.0]],
                    colors: mycolorSelection.myselectedColors // Use the selected colors
                )
                .onAppear {
                    withAnimation(.easeInOut(duration: 8).repeatForever(autoreverses: true)) {
                        isAnimating.toggle()
                    }
                }
            } else {
                // Fallback on earlier versions
            }
            
        }
        
        .ignoresSafeArea()
    }
}



#Preview {
    Test()
}
