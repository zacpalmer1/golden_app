//
//  TopBarView.swift
//  golden
//
//  Created by Zachary Palmer on 11/1/23.
//

import SwiftUI

struct TopBarView: View {
    var body: some View {
        HStack{
            Image(systemName: "list.dash")
                .resizable()
                .frame(width: 22, height: 16)
                .offset(y:10)
            Spacer()
            ZStack{
                Text("g   lden")
                    .font(.system(size: 24, weight: .heavy, design: .rounded))
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.orange, .yellow]), startPoint: .leading, endPoint: .trailing))                    .frame(width: 14)
                    .offset(x: -18,y: 2)
            }
            .offset(y:8)
            Spacer()
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 20, height: 20)
                .offset(y:10)
            
        }
        .padding(40)
    }
}

#Preview {
    TopBarView()
}
