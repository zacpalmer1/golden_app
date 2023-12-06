//
//  Favorites.swift
//  golden
//
//  Created by Zachary Palmer on 10/25/23.
//

import SwiftUI

struct Favorites: View {
    
    var body: some View {
        VStack{
            HStack{
                ZStack{
                    Text("g   lden")
                        .font(.system(size: 24, weight: .heavy, design: .rounded))
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [.orange, .yellow]), startPoint: .leading, endPoint: .trailing))                    .frame(width: 14)
                        .offset(x: -18,y: 2)
                }
            }
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing:0){
                   // ForEach(MockData.items){ item in
                    
                    Image("test4")
                        .resizable()
                        .frame(width:345, height:640)
                        .cornerRadius(15)
                        .containerRelativeFrame(.vertical, count: 1, spacing: 12)
                        .scrollTransition{ content, phase in
                            content
                                .opacity(phase.isIdentity ? 1 : 0.5)
                                .scaleEffect(x: phase.isIdentity ? 1 : 0.7,
                                                y: phase.isIdentity ? 1 : 0.7)
                            }
                            
                        
                    Image("test")
                        .resizable()
                        .frame(width:345, height:640)
                        .cornerRadius(15)
                        .containerRelativeFrame(.vertical, count: 1, spacing: 12)
                        .scrollTransition{ content, phase in
                            content
                                .opacity(phase.isIdentity ? 1 : 0.5)
                                .scaleEffect(x: phase.isIdentity ? 1 : 0.7,
                                             y: phase.isIdentity ? 1 : 0.7)
                        }
                    Image("test3")
                        .resizable()
                        .frame(width:345, height:640)
                        .cornerRadius(15)
                        .containerRelativeFrame(.vertical, count: 1, spacing: 12)
                        .scrollTransition{ content, phase in
                            content
                                .opacity(phase.isIdentity ? 1 : 0.5)
                                .scaleEffect(x: phase.isIdentity ? 1 : 0.7,
                                             y: phase.isIdentity ? 1 : 0.7)
                        }
                    //}
                }
                .scrollTargetLayout()
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .scrollTargetBehavior(.paging)
        }
    }
}

#Preview {
    Favorites()
}
