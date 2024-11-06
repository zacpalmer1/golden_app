//
//  EditProfile.swift
//  golden
//
//  Created by Zachary Palmer on 11/4/24.
//

import SwiftUI

struct EditProfile: View {
    var body: some View {
        VStack{
            HStack{
                ZStack{
                    Image("zaclarge")
                        .resizable()
                        .clipped()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 90, height: 90)
                        .cornerRadius(70)
                    Circle()
                        .frame(width: 90, height: 90)
                        .foregroundStyle(.ultraThinMaterial)
                        .opacity(0.3)
                    Image(systemName: "plus")
                        .resizable()
                        .bold()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.white)
                }
                VStack(alignment: .leading){
                    Text("Name:")
                    Text("Username:")
                }
            }
            ZStack{
                Image("zaclarge")
                    .resizable()
                    .clipped()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 320, height: 400)
                    .cornerRadius(20)
            }
        }
    }
}

#Preview {
    EditProfile()
}
