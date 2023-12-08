//
//  Profile.swift
//  golden
//
//  Created by Zachary Palmer on 10/25/23.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        
        ZStack{
            Image("backdrop")
                .resizable()
                .frame(width: .infinity, height: .infinity)
                
                .ignoresSafeArea()
               // .padding(.bottom, 20)
            Rectangle()
                .foregroundStyle(.bar)
                .ignoresSafeArea()
            VStack{
                
                VStack{
                    
                    Image("profile")
                        .resizable()
                        .frame(width: 105, height: 105)
                        .padding(.bottom, 20)
                      
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
                    
                }
                .offset(y:-15)
                ScrollView{
                    VStack(spacing: 5){
                        VStack{
                            Text("November")
                            
                                .font(.system(size: 35, weight: .heavy, design: .rounded))
                        }
                        .frame(maxWidth: 350, alignment: .leading)
                        ScrollView{
                            HStack{
                                Image("test")
                                    .resizable()
                                    .clipped()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 110, height:180)
                                    .cornerRadius(8)
                                
                                Image("test3")
                                    .resizable()
                                    .clipped()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 110, height:180)
                                    .cornerRadius(8)
                                
                                Image("test4")
                                    .resizable()
                                    .clipped()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 110, height:180)
                                    .cornerRadius(8)
                                
                            }
                            Spacer()
                        }
                        VStack{
                            HStack{
                                Image("test5")
                                    .resizable()
                                    .clipped()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 110, height:180)
                                    .cornerRadius(8)
                                
                                Image("test6")
                                    .resizable()
                                    .clipped()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 110, height:180)
                                    .cornerRadius(8)
                                
                                Image("test7")
                                    .resizable()
                                    .clipped()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 110, height:180)
                                    .cornerRadius(8)
                                
                            }
                        }
                        .frame(maxWidth: 350, alignment: .leading)
                        
                        Spacer()
                    }
                    
                }
                .scrollTargetBehavior(.paging)
            }
            .offset(y: 80)
        }
        //.padding(.top, 200)
    }
}

#Preview {
    Profile()
}
