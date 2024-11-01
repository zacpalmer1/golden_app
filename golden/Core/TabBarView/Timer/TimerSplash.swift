//
//  TimerSplash.swift
//  golden
//
//  Created by Zachary Palmer on 12/7/23.
//

import SwiftUI

struct TimerSplash: View {
    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(.bar)
            VStack{
                Text("Almost time Zac")
                    .foregroundColor(.gray)
                    .font(.system(size: 25, weight: .heavy, design: .rounded))
                Text("Sunset is in ")
                    .foregroundColor(.gray)
                    .font(.system(size: 25, weight: .heavy, design: .rounded))
                
            }
        }
    }
}

#Preview {
    TimerSplash()
}
