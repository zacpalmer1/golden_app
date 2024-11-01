//
//  ProfileCalendar.swift
//  golden
//
//  Created by Zachary Palmer on 9/29/24.
//

import SwiftUI

struct ProfileCalendar: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Menu {
                Button {
                    // Action for September
                } label: {
                    Label("September", systemImage: "none")
                }
                Button {
                    // Action for August
                } label: {
                    Label("August", systemImage: "none")
                }
                Button {
                    // Action for July
                } label: {
                    Label("July", systemImage: "none")
                }
            } label: {
                HStack(spacing: 0) {
                    Text("September")
                        .font(.system(size: 18, weight: .regular, design: .rounded))
                        .padding(.trailing, 6)
                        .foregroundColor(.white)
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 8, height: 12)
                        .foregroundColor(.white)
                }
            }
            
            .padding(.horizontal, 25)
            HStack{
                Text("S")
                    .frame(width:42, height:6)
                    .foregroundColor(.gray)
                    .font(.system(size: 14, weight: .regular, design: .rounded))
                Text("M")
                    .frame(width:42, height:6)
                    .foregroundColor(.gray)
                    .font(.system(size: 14, weight: .regular, design: .rounded))
                Text("T")
                    .frame(width:42, height:6)
                    .foregroundColor(.gray)
                    .font(.system(size: 14, weight: .regular, design: .rounded))
                Text("W")
                    .frame(width:42, height:6)
                    .foregroundColor(.gray)
                    .font(.system(size: 14, weight: .regular, design: .rounded))
                Text("T")
                    .frame(width:42, height:6)
                    .foregroundColor(.gray)
                    .font(.system(size: 14, weight: .regular, design: .rounded))
                Text("F")
                    .frame(width:42, height:6)
                    .foregroundColor(.gray)
                    .font(.system(size: 14, weight: .regular, design: .rounded))
                Text("S")
                    .frame(width:42, height:6)
                    .foregroundColor(.gray)
                    .font(.system(size: 14, weight: .regular, design: .rounded))
            }
            .padding(.horizontal, 25)
            
            HStack{
                Image("test")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .frame(width:42, height:42)
                    .cornerRadius(6)
                Image("test3")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .frame(width:42, height:42)
                    .cornerRadius(6)
                Image("test4")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .frame(width:42, height:42)
                    .cornerRadius(6)
                Image("test5")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .frame(width:42, height:42)
                    .cornerRadius(6)
                Image("test6")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .frame(width:42, height:42)
                    .cornerRadius(6)
                Image("test7")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .frame(width:42, height:42)
                    .cornerRadius(6)
                Image("test6")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .frame(width:42, height:42)
                    .cornerRadius(6)
            }
            .padding(.horizontal, 25)
            HStack{
                Image("test5")
                    .resizable()
                    .frame(width:42, height:42)
                    .cornerRadius(6)
                Image("test4")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .frame(width:42, height:42)
                    .cornerRadius(6)
                ZStack{
                    Rectangle()
                        .frame(width:42, height:42)
                        .cornerRadius(6)
                        .foregroundColor(.blue)
                    Rectangle()
                        .frame(width:42, height:42)
                        .cornerRadius(6)
                        .foregroundStyle(.regularMaterial)
                    
                    Text("22")
                        .foregroundColor(.gray)
                        .font(.system(size: 18, weight: .heavy, design: .rounded))
                }
                ZStack{
                    Rectangle()
                        .frame(width:42, height:42)
                        .cornerRadius(6)
                        .foregroundColor(.blue)
                    Rectangle()
                        .frame(width:42, height:42)
                        .cornerRadius(6)
                        .foregroundStyle(.regularMaterial)
                    
                    Text("21")
                        .foregroundColor(.gray)
                        .font(.system(size: 18, weight: .heavy, design: .rounded))
                }
                Image("test4")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .frame(width:42, height:42)
                    .cornerRadius(6)
                Image("test5")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .frame(width:42, height:42)
                    .cornerRadius(6)
                Image("test")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .frame(width:42, height:42)
                    .cornerRadius(6)
            }
            .padding(.horizontal, 25)
            HStack{
                Image("test3")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .frame(width:42, height:42)
                    .cornerRadius(6)
                Image("test6")
                    .resizable()
                    .frame(width:42, height:42)
                    .cornerRadius(6)
                ZStack{
                    Rectangle()
                        .frame(width:42, height:42)
                        .cornerRadius(6)
                        .foregroundStyle(.regularMaterial)
                    Text("15")
                        .foregroundColor(.gray)
                        .font(.system(size: 18, weight: .heavy, design: .rounded))
                }
                Image("test4")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .frame(width:42, height:42)
                    .cornerRadius(6)
                Image("test3")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .frame(width:42, height:42)
                    .cornerRadius(6)
                Image("test")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .frame(width:42, height:42)
                    .cornerRadius(6)
                Image("test5")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .frame(width:42, height:42)
                    .cornerRadius(6)
            }
            .padding(.horizontal, 25)
            HStack{
                Image("test7")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .frame(width:42, height:42)
                    .cornerRadius(6)
                Image("test4")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .frame(width:42, height:42)
                    .cornerRadius(10)
                Image("test")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:42, height:42)
                    .cornerRadius(6)
                Image("test3")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .frame(width:42, height:42)
                    .cornerRadius(6)
                Image("test5")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .frame(width:42, height:42)
                    .cornerRadius(6)
                ZStack{
                    Rectangle()
                        .frame(width:42, height:42)
                        .cornerRadius(6)
                        .foregroundColor(.blue)
                    Rectangle()
                        .frame(width:42, height:42)
                        .cornerRadius(6)
                        .foregroundStyle(.regularMaterial)
                    
                    Text("5")
                        .foregroundColor(.gray)
                        .font(.system(size: 18, weight: .heavy, design: .rounded))
                }
                ZStack{
                    Rectangle()
                        .frame(width:42, height:42)
                        .cornerRadius(6)
                        .foregroundStyle(.regularMaterial)
                    Text("4")
                        .foregroundColor(.gray)
                        .font(.system(size: 18, weight: .heavy, design: .rounded))
                }
            }
            .padding(.horizontal, 25)
            HStack{
                Image("test3")
                    .resizable()
                    .aspectRatio(contentMode: .fill) // Maintain aspect ratio and fill the frame
                    .frame(width: 42, height: 42)
                    .cornerRadius(6)
                    .clipped()
                ZStack{
                    Rectangle()
                        .frame(width:42, height:42)
                        .cornerRadius(6)
                        .foregroundStyle(.regularMaterial)
                    Text("2")
                        .foregroundColor(.gray)
                        .font(.system(size: 18, weight: .heavy, design: .rounded))
                }
                ZStack{
                    Rectangle()
                        .frame(width:42, height:42)
                        .cornerRadius(6)
                        .foregroundStyle(.regularMaterial)
                    Text("1")
                        .foregroundColor(.gray)
                        .font(.system(size: 18, weight: .heavy, design: .rounded))
                }
                
            }
            .padding(.horizontal, 25)
        }
    }
}

#Preview {
    ProfileCalendar()
}
