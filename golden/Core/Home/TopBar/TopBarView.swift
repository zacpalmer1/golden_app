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
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        ZStack{
            
            VStack(spacing:0){
                
                HStack(spacing:0){
                    Text("Golden")
                        .font(.system(size: 30, weight: .heavy, design: .rounded))
                        .foregroundColor(.white)
                    //.foregroundColor(.gray)
                    
                        Spacer()
                    
                        Button(action: {
                            showingModal = true // Show the modal when the button is tapped
                        }) {
                            ZStack{
                                if #available(iOS 26.0, *) {
                                               RoundedRectangle(cornerRadius: 34, style: .continuous)
                                                   .fill(.clear)
                                                   .frame(width: 110, height: 40)
                                                   .glassEffect( in: RoundedRectangle(cornerRadius: 34), isEnabled: true)
                                                   
                                           } else {
                                               RoundedRectangle(cornerRadius: 34, style: .continuous)
                                                   .fill(.ultraThinMaterial)
                                                   .frame(height: 45)
                                                   
                                           }
                            HStack{
                                Image(systemName: "figure.child.circle")
                                    .resizable()
                                    .frame(width: 19, height: 19)
                                    .foregroundColor(.white)
                                
                                Text("Beta")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .regular, design: .default))
                                Image(systemName: "line.3.horizontal")
                                    .resizable()
                                    .frame(width: 13, height: 6)
                                    .foregroundColor(.white)
                                
                            }
                        }
                        
                    }
                    
                
            
                }
                .containerRelativeFrame([.horizontal, .vertical], {length, axis in
                    if axis == .vertical {
                        return length / 10
                    }
                    else{
                        return length / 1.1
                    }
                })
                HStack{
                    Spacer()
                    tabButton(tab: .homeYesterday, text: "Yesterday")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .regular, design: .default))
                    Spacer()
                    tabButton(tab: .home, text: "Today")
                        .foregroundColor(.white)
                        .alignmentGuide(.leading) { d in
                                                (d.width / 2)
                                            }
                        .font(.system(size: 18, weight: .regular, design: .default))
                    Spacer()
                    tabButton(tab: .homeFeatured, text: "Featured")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .regular, design: .default))
                    Spacer()
                }
                
            
            //.background(Color.blue)
            .colorScheme(.dark)
        }
            .containerRelativeFrame([.horizontal, .vertical], {length, axis in
            if axis == .vertical {
                return length / 4 // small devices5.5
                }
            else {
                   return length
                }
            })
            
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



// ModalGroupView Placeholder
struct MyModalGroupView: View {
    var body: some View {
        Text("Modal Content")
            .font(.largeTitle)
            .padding()
    }
}

// TopBarView Preview
struct TopBarView_Previews: PreviewProvider {
    @State static var selectedTab: Tabs = .home // Initial value for the preview
    
    static var previews: some View {
        TopBarView(selectedTab: $selectedTab)
            .preferredColorScheme(.dark) // Set preferred color scheme
    }
}
