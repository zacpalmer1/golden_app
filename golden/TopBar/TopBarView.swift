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
            VStack{
                Rectangle()
                    .frame(width:.infinity, height:50)
                    .foregroundColor(.clear)
                
                HStack{
                    Text("Golden")
                        .font(.system(size: 28, weight: .heavy, design: .rounded))
                    //.foregroundColor(.gray)
                    
                    Spacer()
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundStyle(.ultraThinMaterial)// Fill color for the RoundedRectangle
                            .frame(width: 118, height: 35) // Background color of the view
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.white, lineWidth: 0.2) // Stroke color and line width
                            )
                        HStack{
                        Image(systemName: "person.2.fill")
                                .resizable()
                                .frame(width: 20, height: 15)
                            
                            Text("Friends")
                                .foregroundColor(.white)
                            
                                
                        }
                    }
                }
                
                .padding(.vertical, 15)
                .padding(.horizontal, 25)
                HStack{
                    Spacer()
                    Text("Yesterday")
                    Spacer()
                    Text("Today")
                        .bold()
                    Spacer()
                    Text("Featured")
                    Spacer()
                }
            }
            
        }
        
    }
}

#Preview {
    TopBarView()
}
