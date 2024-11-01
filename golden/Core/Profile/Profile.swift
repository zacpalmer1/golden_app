import SwiftUI
import AVKit
import PhotosUI

import CoreImage
import CoreImage.CIFilterBuiltins

class VideoViewModel: ObservableObject {
    @Published var selectedVideoURL: URL?
    @Published var isDarkBackground: Bool = false
}

struct Profile: View {
    @State private var usersearch: String = ""
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var colorSelection = ColorSelection()
    @State private var settings = false
    @State private var isVideoPickerPresented: Bool = false
    @State private var scrollOffset: CGFloat = .zero
    
    @State private var showToolbar: Bool = false
    @EnvironmentObject var viewModel: VideoViewModel
    var body: some View {
        NavigationView {
            ScrollView {
                GeometryReader { geometry in
                    let offset = geometry.frame(in: .global).minY

                    ZStack(alignment: .bottom) {
                        if let videoURL = viewModel.selectedVideoURL {
                            CustomVideoPlayerView(url: videoURL)
                                .frame(width: UIScreen.main.bounds.width, height: 302 + (offset > 0 ? offset : 0))
                                .clipped()
                                .offset(y: offset > 0 ? -offset : 0)
                        } else {
                            Image("zac3large")
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width, height: 302 + (offset > 0 ? offset : 0))
                                .clipped()
                                .offset(y: offset > 0 ? -offset : 0)
                        }

                        VStack {
                            

                            Spacer()

                            HStack {
                                Text("Zac Palmer")
                                    .padding()
                                    .foregroundColor(viewModel.isDarkBackground ? .black : .white)
                                    .font(.system(size: 32, weight: .bold))

                                Spacer()

                                ZStack {
                                    RoundedRectangle(cornerRadius: 30)
                                        .foregroundStyle(.ultraThinMaterial)
                                        .frame(width: 105, height: 35)
                                    Text("Edit Profile")
                                        .font(.system(size: 14, weight: .bold))
                                        .foregroundColor(viewModel.isDarkBackground ? .black : .white)
                                }
                                .padding(.trailing, 15)
                            }
                            .offset(y: offset > 0 ? -offset : 0)
                        }
                    }
                }
                .frame(height: 302)
                
                VStack(alignment: .leading) {
                    MyActivity()
                    ProfileRecent()
                        .padding(.top, 13)
                        .padding(.bottom, 15)
                }
                .padding(.top, 13)
                .padding(.horizontal, 20)

                VStack(alignment: .leading) {
                    ZStack {
                        Rectangle()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundStyle(.ultraThinMaterial)

                        VStack(alignment: .leading) {
                            Text("About Zac Palmer")
                                .font(.system(size: 24, weight: .heavy))
                                .padding(.top, 20)
                                .padding(.bottom, 10)
                            Text("Location")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                            Text("Charlotte, NC")
                                .font(.system(size: 16))
                                .padding(.bottom, 10)
                            Text("Following")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                            Text("513")
                                .font(.system(size: 16))
                                .padding(.bottom, 10)
                            Text("Followers")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                            Text("718")
                                .font(.system(size: 16))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 25)
                        .padding(.bottom, 70)
                    }
                }
                .padding(.horizontal, 0)
            }
            .coordinateSpace(name: "scroll")
            .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { value in
                scrollOffset = value
            }
            .navigationBarBackButtonHidden(true)
            //.navigationBarTitle(scrollOffset >= 0 ? "@zacpalmer1" : "zacpalmer1", displayMode: .inline)
            .toolbar {
                
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button(action: {
                            isVideoPickerPresented.toggle()
                        }) {
                            ZStack {
                                Circle()
                                    .frame(width: 30)
                                    .foregroundStyle(.ultraThinMaterial)
                                Image(systemName: "photo.fill")
                                    .resizable()
                                    .frame(width: 16, height: 12)
                                    .foregroundColor(.white)
                            }
                        }
                        
                        Button(action: {
                            settings.toggle()
                        }) {
                            ZStack {
                                Circle()
                                    .frame(width: 30)
                                    .foregroundStyle(.ultraThinMaterial)
                                Image(systemName: "gearshape.fill")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.trailing, 5)
                        .fullScreenCover(isPresented: $settings) {
                            Settings()
                                .transition(.move(edge: .trailing))
                        }
                    }
                    
                }
                
            }
            
        }
        .sheet(isPresented: $isVideoPickerPresented) {
            VideoPicker(selectedVideoURL: $viewModel.selectedVideoURL)
        }
        .scrollIndicators(.hidden)
    }
}

struct ScrollViewOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

#Preview {
    Profile()
}
