//
//  TestHome.swift
//  golden
//
//  Created by Zachary Palmer on 12/7/23.
//

import SwiftUI

struct TestHome: View {
    let images = ["test", "test3", "test4", "test5"] // Replace with your image names

       @State private var currentIndex = 0
       @State private var opacity: Double = 1.0

       var body: some View {
           ScrollView {
               LazyVStack(spacing: 0) {
                   ForEach(images.indices, id: \.self) { index in
                       GeometryReader { geometry in
                           ZStack{
                               Image(images[index])
                                   .resizable()
                                   .scaledToFill()
                                   .frame(height: UIScreen.main.bounds.height)
                                   .clipped()
                                   .opacity(index == currentIndex ? 1.0 : opacity)
                                   .onChange(of: currentIndex) { newIndex in
                                       withAnimation(.easeInOut(duration: 0.5)) {
                                           opacity = 0.0
                                       }
                                   }
                                   .onChange(of: opacity) { newOpacity in
                                       if newOpacity == 0.0 {
                                           currentIndex = (currentIndex + 1) % images.count
                                           withAnimation(.easeInOut(duration: 0.5)) {
                                               opacity = 1.0
                                           }
                                       }
                                   }
                                   .background(
                                    Image(images[currentIndex])
                                        .resizable()
                                    //.scaledToFill()
                                    //.frame(width: 300, height: 300)
                                        .clipped()
                                   )
                           }
                           Rectangle()
                               .foregroundStyle(.bar)
                               //.ignoresSafeArea()
                               //.scaledToFit()
                               .frame(width: .infinity, height: .infinity)
                       }
                       
                       .frame(height: UIScreen.main.bounds.height)
                   }
                   
               }
               
           }
           .scrollTargetBehavior(.paging)
           .edgesIgnoringSafeArea(.all)
       }
}

#Preview {
    TestHome()
}
