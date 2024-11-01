//
//  UserBubbleExpanded.swift
//  golden
//
//  Created by Zachary Palmer on 12/6/23.
//

import SwiftUI

struct UserBubbleExpanded: View {
    var body: some View {
        VStack{
            VStack{
                ZStack{
                    Rectangle()
                        .frame(width: 40, height: 6)
                        .cornerRadius(20)
                        .foregroundStyle(.gray)
                        .offset(y:-150)
                    Text("...")
                        .font(.system(size: 25, weight: .heavy, design: .rounded))
                        .offset(x:155, y:-156)
                    
                }
                Text("zacpalmer1")
                    .font(.system(size: 18, weight: .heavy, design: .rounded))
                    .offset(y:-4)
                //this is for github
                HStack{
                    Text("followers: 76")
                        .font(.system(size: 15, weight: .heavy, design: .rounded))
                    Text("following: 68")
                        .font(.system(size: 15, weight: .heavy, design: .rounded))
                }
                ZStack{
                    Rectangle()
                        .frame(width: 100, height: 30)
                        .cornerRadius(30)
                        .foregroundColor(.green)
                    Text("Following")
                        .font(.system(size: 15, weight: .heavy, design: .rounded))
                        .foregroundColor(.white)
                }
                
                .padding(.bottom, 5)
            }
            .offset(y:-10)
            ScrollView(.horizontal, showsIndicators: false){
                VStack{
                    Text("November")
                        .font(.system(size: 35, weight: .heavy, design: .rounded))
                }
                .offset(y:25)
                .frame(maxWidth: 350, alignment: .leading)
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        HStack{
                            ZStack{
                                Image("test")
                                    .resizable()
                                    .clipped()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 110, height:180)
                                    .cornerRadius(8)
                               
                            }
                            ZStack{
                                Image("test3")
                                    .resizable()
                                    .clipped()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 110, height:180)
                                    .cornerRadius(8)
                                
                            }
                            ZStack{
                                Image("test4")
                                    .resizable()
                                    .clipped()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 110, height:180)
                                    .cornerRadius(8)
                               
                            }
                        }
                        Spacer()
                    }
                    
                    HStack{
                        ZStack{
                            Image("test5")
                                .resizable()
                                .clipped()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 110, height:180)
                                .cornerRadius(8)
                            
                        }
                        ZStack{
                            Image("test6")
                                .resizable()
                                .clipped()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 110, height:180)
                                .cornerRadius(8)
                          
                        }
                        ZStack{
                            Image("test7")
                                .resizable()
                                .clipped()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 110, height:180)
                                .cornerRadius(8)
                            
                        }
                    }
                    Spacer()
                    HStack{
                        Image("test4")
                            .resizable()
                            .frame(width: 110, height:180)
                            .clipped()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(8)
                        Image("test3")
                            .resizable()
                            .frame(width: 110, height:180)
                            .clipped()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(8)
                        Image("test6")
                            .resizable()
                            .frame(width: 110, height:180)
                            .clipped()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(8)
                        
                    }
                    Spacer()
                    HStack{
                        Image("test7")
                            .resizable()
                            .frame(width: 110, height:180)
                            .clipped()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(8)
                        Image("test")
                            .resizable()
                            .frame(width: 110, height:180)
                            .clipped()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(8)
                        Image("test5")
                            .resizable()
                            .frame(width: 110, height:180)
                            .clipped()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(8)
                        
                    }
                    
                }
                
                .offset(y:20)
                .scrollTargetBehavior(.paging)
                
                //.padding()
            }
            
            }
        
            .frame(width: 350, height:585)
            .containerRelativeFrame(.vertical, count: 2, spacing: 15)
            
            .offset(y:-165)
        
        }
        
    
}

#Preview {
    UserBubbleExpanded()
}
