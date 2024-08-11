//
//  TopBarView.swift
//  golden
//
//  Created by Zachary Palmer on 11/1/23.
//

import SwiftUI

struct TopBarView: View {
    @Binding var selectedTab: Tabs
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
                    tabButton(tab: .homeYesterday, text: "Yesterday")
                        .frame(maxWidth: .infinity)
                    Spacer()
                    tabButton(tab: .home, text: "Today")
                        .alignmentGuide(.leading) { d in
                                                (d.width / 2)
                                            }
                    Spacer()
                    tabButton(tab: .homeFeatured, text: "Featured")
                        .frame(maxWidth: .infinity)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            
            
           
        }
        
    }
    private func tabButton(tab: Tabs, text: String) -> some View {
        Button(action: {
            selectedTab = tab
        }) {
            Text(text)
                .foregroundColor(.white)
                .fontWeight(selectedTab == tab ? .bold : .regular)
                .font(.system(size: 15))
        }
    }
}
