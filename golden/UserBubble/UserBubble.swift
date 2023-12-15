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
            Image("backdrop")
                .resizable()
                //.aspectRatio(contentMode: .fill)
                .clipped()
                
                .cornerRadius(15)
                .frame(maxWidth: expand ? .infinity : 350, maxHeight: expand ? .infinity : 50)
                .offset(x:0, y: expand ? 0 : 300)
            Rectangle()
                .frame(maxWidth: expand ? .infinity : 360, maxHeight: expand ? .infinity : 52)
                .cornerRadius(15)
                .offset(x:0, y: expand ? 0 : 300)
                .foregroundStyle(expand ? .bar : .bar)
            
               // .edgesIgnoringSafeArea(.all)
            
            HStack{
                if expand {Spacer(minLength: 0)}
                HStack{
                    Image("profile")
                        .resizable()
                        .frame(width: expand ? height : 35, height: expand ? height : 35)
                        .offset(x:0, y: expand ? -250 :300)
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
                    UserBubbleExpanded()
                    .offset(y:240)
                    
                }
                
            }
            .animation(.snappy(duration: 0.3))
            }
            .onTapGesture(perform: {withAnimation(.snappy()){expand.toggle()}
            })
            .ignoresSafeArea()
        }
}
