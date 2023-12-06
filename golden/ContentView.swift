//
//  ContentView.swift
//  golden
//
//  Created by Zachary Palmer on 10/24/23.
//

import SwiftUI

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

struct ContentView: View {
    
    @State var selectedTab: Tabs = .home
    @State var expand = false
    @Namespace var animation
    
    
    var body: some View {
        VStack{
            ZStack{
                Home()
                    .padding(.bottom, 40)
                    .offset(y:15)
                TabBarView(selectedTabs: $selectedTab)
                TopBarView()
                    .offset(y:-362)
                    .padding(.bottom)
                UserBubble(animation: animation, expand: $expand)
                    .offset(y:expand ? 0 : 0)
            }
        }
    }
}

#Preview {
    
    ContentView()
}
