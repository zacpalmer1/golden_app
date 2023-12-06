//
//  UserBubble.swift
//  golden
//
//  Created by Zachary Palmer on 10/27/23.
//

import SwiftUI

struct UserBubble: View {
    var animation: Namespace.ID
    @Binding var expand : Bool
    var height = UIScreen.main.bounds.height / 7
    var body: some View {
        ZStack{
            
            Rectangle()
                .frame(maxWidth: expand ? .infinity : 360, maxHeight: expand ? .infinity : 55)
                .cornerRadius(15)
                .offset(x:0, y: expand ? 0 : 300)
                .foregroundStyle(expand ? .ultraThinMaterial : .ultraThinMaterial)
                .edgesIgnoringSafeArea(.all)
            
            HStack{
                if expand {Spacer(minLength: 0)}
                HStack{
                    Image("profile")
                        .resizable()
                        .frame(width: expand ? height : 35, height: expand ? height : 35)
                        .offset(x:0, y: expand ? -270 :300)
                        //.foregroundColor(.red)
                }
                if !expand{
                    Text("zacpalmer1")
                        .offset(x:0, y:expand ? 0 :300)
                        .foregroundColor(.white)
                    Image(systemName: "sun.horizon.fill")
                        .offset(x:29, y:expand ? 0 :300)
                        .foregroundColor(.white)
                    Text("2")
                        .offset(x:29, y:expand ? 0 :300)
                        .foregroundColor(.white)
                    Image(systemName: "heart.fill")
                        .offset(x:39, y:expand ? 0 :300)
                        .foregroundColor(.white)
                    Text("3")
                        .offset(x:39, y:expand ? 0 :300)
                        .foregroundColor(.white)
                    Image(systemName: "message.fill")
                        .offset(x:49, y:expand ? 0 :300)
                        .foregroundColor(.white)
                    Text("8")
                        .offset(x:49, y:expand ? 0 :300)
                        .foregroundColor(.white)
                }
                Spacer()
            }
            .padding(28)
            VStack{
                if expand{
                    VStack{
                        VStack{
                            Text("zacpalmer1")
                                .font(.system(size: 18, weight: .heavy, design: .rounded))
                                .offset(y:-4)
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
                                        Rectangle()
                                            .frame(width: 110, height:180)
                                            .cornerRadius(8)
                                            .foregroundStyle(.ultraThickMaterial)
                                        Rectangle()
                                            .frame(width: 110, height:180)
                                            .cornerRadius(8)
                                            .foregroundStyle(.ultraThickMaterial)
                                        Rectangle()
                                            .frame(width: 110, height:180)
                                            .cornerRadius(8)
                                            .foregroundStyle(.ultraThickMaterial)
                                        
                                    }
                                }
                                VStack{
                                    Text("October")
                                        
                                        .font(.system(size: 35, weight: .heavy, design: .rounded))
                                }
                                .frame(maxWidth: 350, alignment: .leading)
                                HStack{
                                    Rectangle()
                                        .frame(width: 110, height:180)
                                        .cornerRadius(8)
                                        .foregroundStyle(.ultraThickMaterial)
                                    Rectangle()
                                        .frame(width: 110, height:180)
                                        .cornerRadius(8)
                                        .foregroundStyle(.ultraThickMaterial)
                                    Rectangle()
                                        .frame(width: 110, height:180)
                                        .cornerRadius(8)
                                        .foregroundStyle(.ultraThickMaterial)
                                }
                                VStack{
                                    Text("September")
                                        
                                        .font(.system(size: 35, weight: .heavy, design: .rounded))
                                }
                                .frame(maxWidth: 350, alignment: .leading)
                                HStack{
                                    Rectangle()
                                        .frame(width: 110, height:180)
                                        .cornerRadius(8)
                                        .foregroundStyle(.ultraThickMaterial)
                                    
                                    Rectangle()
                                        .frame(width: 110, height:180)
                                        .cornerRadius(8)
                                        .foregroundStyle(.ultraThickMaterial)
                                    
                                    Rectangle()
                                        .frame(width: 110, height:180)
                                        .cornerRadius(8)
                                        .foregroundStyle(.ultraThickMaterial)
                                }
                            }
                        }
                    }
                    .offset(y:240)
                    
                }
                
            }
            .animation(.easeInOut(duration: 0.8))
            
            
            }
            
            .onTapGesture(perform: {withAnimation(.snappy()){expand.toggle()}
            })
            .ignoresSafeArea()
        }
    //}
}
