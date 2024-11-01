//
//  SearchGradient.swift
//  golden
//
//  Created by Zachary Palmer on 9/26/24.
//

import SwiftUI

struct FollowGradient: View {
    @State private var isAnimating = false
    var body: some View {
        ZStack{
            if #available(iOS 18.0, *) {
                MeshGradient(
                    width: 3,
                    height: 3,
                    points: [[0.0,0.0],[isAnimating ? 0.1 : 0.9,0.0],[1.0,0.0],
                             [0.0,0.5],[0.5,isAnimating ? 1.0 : 0.1],[1.0,isAnimating ? 1.0 : 0.4],
                             [0.0,1.0],[isAnimating ? 0.1 : 0.9,1.0],[1.0,1.0]],
                    colors: follow)
                .onAppear{
                    withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)){
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
    FollowGradient()
}
