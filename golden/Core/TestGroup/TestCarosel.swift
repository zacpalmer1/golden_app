//
//  TestCarosel.swift
//  golden
//
//  Created by Zachary Palmer on 8/11/24.
//

import SwiftUI

struct TestCarosel: View {
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                Rectangle()
                    .frame(width:200, height: 200)
                    .cornerRadius(20)
                    .foregroundColor(.gray)
                Rectangle()
                    .frame(width:200, height: 200)
                    .cornerRadius(20)
                    .foregroundColor(.gray)
                Rectangle()
                    .frame(width:200, height: 200)
                    .cornerRadius(20)
                    .foregroundColor(.gray)
                ScrollView(.vertical){
                    
                }
                
            }
        }
    }
}

#Preview {
    TestCarosel()
}
