//
//  MessageModal.swift
//  golden
//
//  Created by Zachary Palmer on 11/1/24.
//

import SwiftUI

struct MessageModal: View {
    var body: some View {
        VStack{
            HStack{
                
                Text("New Message")
                    .font(.system(size: 24, weight: .heavy, design: .default))
                Spacer()
                Text("Cancel")
                    .font(.system(size: 16, weight: .regular, design: .default))
                    .foregroundColor(.blue)
            }
            .padding(.vertical, 10)
            Divider()
            HStack{
                Text("To:")
                    .font(.system(size: 16, weight: .regular, design: .default))
                    .padding(.vertical, 5)
                TextField("", text: .constant(""))
                Spacer()
                Image(systemName: "plus.circle")
                    .resizable()
                    .foregroundColor(.blue)
                    .frame(width: 22, height: 22)
            }
            Divider()
                .padding(.bottom, 5)
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(userFeedData, id: \.name) { user in
                        SearchableItem(user: user)
                    }
                }
            }
        }
        .padding(.horizontal, 17)
        .padding(.top, 20)
    }
}

#Preview {
    MessageModal()
}
