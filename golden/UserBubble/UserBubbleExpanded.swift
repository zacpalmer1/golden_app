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
                        .offset(y:-168)
                    Text("...")
                        .font(.system(size: 25, weight: .heavy, design: .rounded))
                        .offset(x:155, y:-174)
                    
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
            
            VStack{
                Text("November")
                    .font(.system(size: 35, weight: .heavy, design: .rounded))
                }
            .offset(y:-10)
                .frame(maxWidth: 350, alignment: .leading)
            ScrollView(.vertical, showsIndicators: false){
                VStack{
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
                
                HStack{
                    Image("test5")
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
                    Image("test7")
                        .resizable()
                        .frame(width: 110, height:180)
                        .clipped()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(8)
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
            }
            .offset(y:-20)
            
            
        }
        .frame(width: .infinity, height:570)
        .containerRelativeFrame(.vertical, count: 2, spacing: 15)
        .scrollTargetBehavior(.paging)
        .offset(y:-165)
    }
}

#Preview {
    UserBubbleExpanded()
}
