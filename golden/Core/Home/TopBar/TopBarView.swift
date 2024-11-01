//
//  TopBarView.swift
//  golden
//
//  Created by Zachary Palmer on 11/1/23.
//

import SwiftUI

struct TopBarView: View {
    @Binding var selectedTab: Tabs
    @State private var showingModal = false
    var body: some View {
        
        ZStack{
            VStack{
                Rectangle()
                    .frame(width:.infinity, height:50)
                    .foregroundColor(.clear)
                
                HStack{
                    Text("Golden")
                        .font(.system(size: 30, weight: .heavy, design: .default))
                    //.foregroundColor(.gray)
                    
                    Spacer()
                    
                        Button(action: {
                            showingModal = true // Show the modal when the button is tapped
                        }) {
                            ZStack{
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundStyle(.ultraThinMaterial)// Fill color for the RoundedRectangle
                                .frame(width: 118, height: 35) // Background color of the view
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.gray, lineWidth: 0.2) // Stroke color and line width
                                )
                            HStack{
                                Image(systemName: "person.2.fill")
                                    .resizable()
                                    .frame(width: 20, height: 15)
                                    .foregroundColor(.white)
                                
                                Text("Friends")
                                    .foregroundColor(.white)
                                
                                
                            }
                        }
                        
                    }
                    .sheet(isPresented: $showingModal) {
                        ModalGroupView() // The view to be presented in the modal
                    }
                
            
                }
                
                .padding(.vertical, 15)
                .padding(.horizontal, 17)
                HStack{
                    Spacer()
                    tabButton(tab: .homeYesterday, text: "Yesterday")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                    Spacer()
                    tabButton(tab: .home, text: "Today")
                        .foregroundColor(.white)
                        .alignmentGuide(.leading) { d in
                                                (d.width / 2)
                                            }
                    Spacer()
                    tabButton(tab: .homeFeatured, text: "Featured")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                
            }
            
            
            .colorScheme(.dark)
        }
        
    }
    private func tabButton(tab: Tabs, text: String) -> some View {
        Button(action: {
            selectedTab = tab
        }) {
            Text(text)
                
                .fontWeight(selectedTab == tab ? .bold : .regular)
                .font(.system(size: 15))
        }
    }
}
