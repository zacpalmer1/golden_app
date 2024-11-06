//
//  SynchronizedScrollViews.swift
//  golden
//
//  Created by Zachary Palmer on 11/4/24.
//

import SwiftUI

struct SynchronizedScrollViews: View {
    @State private var scrollOffset: CGFloat = 0

    var body: some View {
        VStack {
            ScrollViewReader { proxy1 in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<50) { index in
                            Text("Item \(index)")
                                .frame(width: 100, height: 100)
                                .background(Color.blue)
                                .border(Color.black)
                        }
                    }
                    .background(GeometryReader { geo -> Color in
                        DispatchQueue.main.async {
                            self.scrollOffset = geo.frame(in: .global).minX
                        }
                        return Color.clear
                    })
                }
            }
            .frame(height: 120)

            ScrollViewReader { proxy2 in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<50) { index in
                            Text("Item \(index)")
                                .frame(width: 100, height: 100)
                                .background(Color.green)
                                .border(Color.black)
                        }
                    }
                    .offset(x: scrollOffset) // Apply the synchronized scroll position here
                }
            }
            .frame(height: 120)
        }
    }
}

#Preview {
    SynchronizedScrollViews()
}
