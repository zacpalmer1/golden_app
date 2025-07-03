//
//  HomeBackground.swift
//  golden
//
//  Created by Zachary Palmer on 12/15/24.
//

import SwiftUI

struct HomeBackground: View {
    @State private var currentImageIndex = 0
    @State private var backgroundOpacity: Double = 1.0
    var body: some View {
        ZStack{
            Image(MockData.items[currentImageIndex])
                .resizable()
                .opacity(backgroundOpacity)
                .ignoresSafeArea()
            Rectangle()
                .foregroundStyle(.ultraThinMaterial)
                .ignoresSafeArea()
            VStack(spacing: 0) {
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.black, Color.clear]),
                            startPoint: .bottom,
                            endPoint: .top
                        )
                    )
                    .containerRelativeFrame([.horizontal, .vertical], { length, axis in
                        if axis == .vertical {
                            return length / 4
                        }
                        else{
                            return length
                        }
                    })
                
                Rectangle()
                    .containerRelativeFrame([.horizontal, .vertical], { length, axis in
                        if axis == .vertical {
                            return length / 1.19
                        }
                        else{
                            return length
                        }
                    })
                    .foregroundColor(.black)
            }
        }
    }
}

#Preview {
    HomeBackground()
}
