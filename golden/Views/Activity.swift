//
//  Activity.swift
//  golden
//
//  Created by Zachary Palmer on 10/25/23.
//

import SwiftUI

struct Activity: View {
    var body: some View {
        ZStack{
            Image("test5")
                .resizable()
                .frame(width: .infinity, height: .infinity)
            
                .ignoresSafeArea()
            // .padding(.bottom, 20)
            Rectangle()
                .foregroundStyle(.bar)
                .ignoresSafeArea()
            ZStack{
                VStack(alignment:.leading){
                    Spacer()
                    Text("Likes")
                        .font(.system(size: 25, weight: .heavy, design: .rounded))
                    ZStack(alignment:.leading){
                        Rectangle()
                            .frame(width:140, height:50)
                            .foregroundStyle(.bar)
                            .cornerRadius(15)
                        HStack{
                            Image("profile")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("leebron3")
                                .font(.system(size: 17, weight: .heavy, design: .rounded))
                            Spacer()
                            Text("20sec")
                                .font(.system(size: 14, design: .rounded))
                                .offset(x:-10)
                        }
                        .offset(x:10)
                    }
                    ZStack(alignment:.leading){
                        Rectangle()
                            .frame(width:140, height:50)
                            .foregroundStyle(.bar)
                            .cornerRadius(15)
                        HStack{
                            Image("profile")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("cooneyd")
                                .font(.system(size: 17, weight: .heavy, design: .rounded))
                            Spacer()
                            Text("56sec")
                                .font(.system(size: 14, design: .rounded))
                                .offset(x:-10)
                        }
                        .offset(x:10)
                    }
                    ZStack(alignment:.leading){
                        Rectangle()
                            .frame(width:160, height:50)
                            .foregroundStyle(.bar)
                            .cornerRadius(15)
                        HStack{
                            Image("profile")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("joshpowers")
                                .font(.system(size: 17, weight: .heavy, design: .rounded))
                            Spacer()
                            Text("1min")
                                .font(.system(size: 14, design: .rounded))
                                .offset(x:-10)
                        }
                        .offset(x:10)
                    }
                    
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .cornerRadius(19)
                        .foregroundColor(.gray)
                    Text("Comments")
                        .font(.system(size: 25, weight: .heavy, design: .rounded))
                    ZStack(alignment:.leading){
                        Rectangle()
                            .frame(width:160, height:50)
                            .foregroundStyle(.bar)
                            .cornerRadius(15)
                        HStack{
                            Image("profile")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("joshpowers")
                                .font(.system(size: 17, weight: .heavy, design: .rounded))
                            Spacer()
                            Text("Wow! This is beau...")
                                .font(.system(size: 14, design: .rounded))
                                .offset(x:-10)
                        }
                        .offset(x:10)
                    }
                    ZStack(alignment:.leading){
                        Rectangle()
                            .frame(width:140, height:50)
                            .foregroundStyle(.bar)
                            .cornerRadius(15)
                        HStack{
                            Image("profile")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("jackmalo")
                                .font(.system(size: 17, weight: .heavy, design: .rounded))
                            Spacer()
                            Text("My sunset is so m...")
                                .font(.system(size: 14, design: .rounded))
                                .offset(x:-10)
                        }
                        .offset(x:10)
                    }
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .cornerRadius(19)
                        .foregroundColor(.gray)
                    Text("Suggested")
                        .font(.system(size: 25, weight: .heavy, design: .rounded))
                    ZStack(alignment:.leading){
                        Rectangle()
                            .frame(width:140, height:50)
                            .foregroundStyle(.bar)
                            .cornerRadius(15)
                        HStack{
                            Image("profile")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("leodicap")
                                .font(.system(size: 17, weight: .heavy, design: .rounded))
                            Spacer()
                            ZStack{
                                Rectangle()
                                    .frame(width: 80, height: 30)
                                    .cornerRadius(30)
                                    .foregroundColor(.blue)
                                Text("Follow")
                                    .font(.system(size: 15, weight: .heavy, design: .rounded))
                                    .foregroundColor(.white)
                            }
                            .offset(x:-10)
                        }
                        .offset(x:10)
                    }
                    ZStack(alignment:.leading){
                        Rectangle()
                            .frame(width:150, height:50)
                            .foregroundStyle(.bar)
                            .cornerRadius(15)
                        HStack{
                            Image("profile")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("thimothee")
                                .font(.system(size: 17, weight: .heavy, design: .rounded))
                            Spacer()
                            ZStack{
                                Rectangle()
                                    .frame(width: 80, height: 30)
                                    .cornerRadius(30)
                                    .foregroundColor(.blue)
                                Text("Follow")
                                    .font(.system(size: 15, weight: .heavy, design: .rounded))
                                    .foregroundColor(.white)
                            }
                            .offset(x:-10)
                        }
                        .offset(x:10)
                    }
                    Spacer()
                    Spacer()
                }
                .frame(maxWidth: 350, alignment: .leading)
                Rectangle()
                    .frame(maxWidth: 360, maxHeight: 52)
                    .cornerRadius(15)
                    .offset(x:0, y: 300)
                    .foregroundStyle(.bar)
                    .edgesIgnoringSafeArea(.all)
                Image(systemName: "magnifyingglass")
                    .offset(x:-155, y: 300)
                Text("Find Friends")
                    .offset(x:-85, y: 300)
            }
        }
    }
}

#Preview {
    Activity()
}
