//
//  Home2.swift
//  golden
//
//  Created by Zachary Palmer on 7/2/25.
//

import SwiftUI

struct Home2: View {
    @State private var currentImageIndex = 0
    @State private var backgroundOpacity: Double = 1.0
    @State private var currentAmount: CGFloat = 0
    var body: some View {
        ZStack {
            Image(MockData.items[currentImageIndex])
                .resizable()
                .opacity(backgroundOpacity)
                .ignoresSafeArea()
            Rectangle()
                .foregroundStyle(.ultraThinMaterial)
                .ignoresSafeArea()
            VStack {
                Spacer(minLength: 100)
                ScrollView(.vertical) {
                    LazyVStack(spacing: 90) {
                        ForEach(MockData.items.indices, id: \.self) { index in
                            Image(MockData.items[index])
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .containerRelativeFrame([.horizontal, .vertical], {length, axis in
                                    if axis == .vertical {
                                        return length / 1
                                    }
                                    else{
                                        return length
                                    }
                                })
                                .cornerRadius(50)
                                .scaleEffect(1 + currentAmount)
                        }
                    }
                    // viewAligned requires scrollTargetLayout
                    .scrollTargetLayout()
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                .frame(maxWidth: .infinity)
                
                // Limit scrolling to one view at a time
                .scrollTargetBehavior(.viewAligned(limitBehavior: .alwaysByOne))
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}
#Preview {
    Home2()
}

