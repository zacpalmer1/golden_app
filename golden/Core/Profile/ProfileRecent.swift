import SwiftUI

struct ProfileRecent: View {
    
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .top){
                VStack{
                    Image("test3")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .containerRelativeFrame([.horizontal, .vertical], {length, axis in
                            if axis == .vertical {
                                return length / 2.1
                            }
                            else{
                                return length / 2.2
                            }
                        })
                        .cornerRadius(16)
                    DaytimeGradient(colors: card2)
                        .containerRelativeFrame([.horizontal, .vertical], {length, axis in
                            if axis == .vertical {
                                return length / 4.2
                            }
                            else{
                                return length / 2.2
                            }
                        })
                        .cornerRadius(16)
                }
                VStack{
                    DaytimeGradient(colors: card4)
                        .containerRelativeFrame([.horizontal, .vertical], {length, axis in
                            if axis == .vertical {
                                return length / 4.2
                            }
                            else{
                                return length / 2.2
                            }
                        })
                        .cornerRadius(16)
                    Image("test5")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .containerRelativeFrame([.horizontal, .vertical], {length, axis in
                            if axis == .vertical {
                                return length / 2.1
                            }
                            else{
                                return length / 2.2
                            }
                        })
                        .cornerRadius(16)
                }
            }
        }
        
    }
    
}

#Preview{
    ProfileRecent()
}
