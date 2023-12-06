//
//  Home.swift
//  golden
//
//  Created by Zachary Palmer on 10/25/23.
//
import SwiftUI

struct Home: View {
    var body: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing:0){
                   // ForEach(MockData.items){ item in
                    
                    Image("test")
                        .resizable()
                        .frame(width:345, height:640)
                        .cornerRadius(15)
                        .containerRelativeFrame(.vertical, count: 1, spacing: 12)
                        .scrollTransition{ content, phase in
                            content
                                .opacity(phase.isIdentity ? 1 : 0.5)
                                .scaleEffect(x: phase.isIdentity ? 1 : 0.7,
                                                y: phase.isIdentity ? 1 : 0.7)
                            }
                            
                        
                    Image("test3")
                        .resizable()
                        .frame(width:345, height:640)
                        .cornerRadius(15)
                        .containerRelativeFrame(.vertical, count: 1, spacing: 12)
                        .scrollTransition{ content, phase in
                            content
                                .opacity(phase.isIdentity ? 1 : 0.5)
                                .scaleEffect(x: phase.isIdentity ? 1 : 0.7,
                                             y: phase.isIdentity ? 1 : 0.7)
                        }
                    Image("test4")
                        .resizable()
                        .frame(width:345, height:640)
                        .cornerRadius(15)
                        .containerRelativeFrame(.vertical, count: 1, spacing: 12)
                        .scrollTransition{ content, phase in
                            content
                                .opacity(phase.isIdentity ? 1 : 0.5)
                                .scaleEffect(x: phase.isIdentity ? 1 : 0.7,
                                             y: phase.isIdentity ? 1 : 0.7)
                        }
                    //}
                }
                .scrollTargetLayout()
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .scrollTargetBehavior(.paging)
        }
        
    }
}

#Preview {
    Home()
}
    
struct Item: Identifiable {
    let id = UUID()
    let color: Color
    let count: Int
}

struct MockData {
    static var items = [Item(color: .blue, count: 1),
                        Item(color: .orange, count: 2),
                        Item(color: .yellow, count: 3),
                        Item(color: .red, count: 4),
                        Item(color: .green, count: 5),
                        Item(color: .pink, count: 6)]
}
