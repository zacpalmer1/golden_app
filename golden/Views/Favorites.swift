//
//  Favorites.swift
//  golden
//
//  Created by Zachary Palmer on 10/25/23.
//

import SwiftUI

struct Favorites: View {
    var body: some View {
        @Namespace var animation
        @State var expand = false
        
            VStack{
                ZStack{
                    Image("test7")
                        .resizable()
                        .frame(width: .infinity, height: .infinity)

                        .ignoresSafeArea()
                    // .padding(.bottom, 20)
                    Rectangle()
                        .foregroundStyle(.bar)
                        .ignoresSafeArea()
                ScrollView(.vertical, showsIndicators: false){
                    
                    VStack(spacing:0){
                        // ForEach(MockData.items){ item in
                        
                        Image("test7")
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
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                            .containerRelativeFrame(.vertical, count: 1, spacing: 12)
                            .scrollTransition{ content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1 : 0.5)
                                    .scaleEffect(x: phase.isIdentity ? 1 : 0.7,
                                                 y: phase.isIdentity ? 1 : 0.7)
                            }
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
                        Image("test5")
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
                        Image("test6")
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
                        Image("test7")
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
                .frame(width:345, height:650)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .scrollTargetBehavior(.paging)
                UserBubble(animation: animation, expand: $expand)
            }
                
        }
        
    }
}

#Preview {
    Favorites()
}
