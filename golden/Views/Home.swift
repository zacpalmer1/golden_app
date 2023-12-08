//
//  Home.swift
//  golden
//
//  Created by Zachary Palmer on 10/25/23.
//
import SwiftUI
struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}
struct Home: View {
    @Namespace var animation
    @State var expand = false
    var body: some View {
        
            VStack{
                ZStack{
                    Image("test")
                        .resizable()
                        .frame(width: .infinity, height: .infinity)
                        .ignoresSafeArea()
                    // .padding(.bottom, 20)
                    Rectangle()
                        .foregroundStyle(.bar)
                        .ignoresSafeArea()
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
                            .tag(1)
                        
                        
                        Image("test3")
                            .resizable()
                            .frame(width:345, height:640)
                            .cornerRadius(15)
                            .aspectRatio(contentMode: .fill)
                            .clipped()
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
                        Image("test5")
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
                        Image("test6")
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
                        Image("test7")
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
                .frame(width:345, height:650)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .scrollTargetBehavior(.paging)
                //UserBubble(animation: animation, expand: $expand)
            }
                
        }
        
    }
}

#Preview {
    Home()
}
    
