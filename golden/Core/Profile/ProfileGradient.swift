//
//  SearchGradient.swift
//  golden
//
//  Created by Zachary Palmer on 9/26/24.
//

import SwiftUI

struct ProfileGradient: View {
    var body: some View {
        ZStack{
            if #available(iOS 18.0, *) {
                MeshGradient(
                    width: 3,
                    height: 3,
                    points: [[0.0,0.0],[0.5,0.0],[1.0,0.0],
                             [0.0,0.5],[0.5,0.5],[1.0,0.5],
                             [0.0,1.0],[0.5,1.0],[1.0,1.0]],
                    colors: ocean)
            } else {
                // Fallback on earlier versions
            }
                
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ProfileGradient()
}
