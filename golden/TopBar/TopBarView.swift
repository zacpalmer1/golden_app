//
//  TopBarView.swift
//  golden
//
//  Created by Zachary Palmer on 11/1/23.
//

import SwiftUI

struct TopBarView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width:.infinity, height:70)
                .foregroundColor(.clear)
            HStack{
              
                ZStack{
                    Text("g   lden")
                        .font(.system(size: 24, weight: .heavy, design: .rounded))
                       // .foregroundColor(.white)
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [.orange, .yellow]), startPoint: .leading, endPoint: .trailing))                    .frame(width: 14)
                        .offset(x: -18,y: 2)
                }
                .offset(y:8)
               
            }
            
            .padding(35)
        }
    }
}

#Preview {
    TopBarView()
}
