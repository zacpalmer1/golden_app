//
//  NewSearchView.swift
//  golden
//
//  Created by Zachary Palmer on 12/15/24.
//

import SwiftUI

struct NewSearchView: View {
    var body: some View {
        VStack{
            // Search Text
            HStack{
                Text("Search")
                    .font(.system(size: 30, weight: .heavy, design: .rounded))
                Spacer()
            }
            .padding(.horizontal, 17)
            
        }
        
    }
}

#Preview {
    NewSearchView()
}
