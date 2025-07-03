import SwiftUI
import AVKit
import PhotosUI

import CoreImage
import CoreImage.CIFilterBuiltins

class VideoViewModel: ObservableObject {
    @Published var selectedVideoURL: URL?
    @Published var isDarkBackground: Bool = false
}
let exampleUsers: [UserFeedItem] = [
    UserFeedItem(
        image: "joshlarge",
        name: "Josh Powers",
        username: "joshpowers",
        followersCount: "675",
        streaks: "5",
        likes: "2",
        comments: "2",
        date: "Today",
        favoritePosts: ["joshlarge1", "joshlarge2", "joshlarge3", "joshlarge4", "joshlarge5", "joshlarge6"]
    ),
    UserFeedItem(
        image: "kennlarge",
        name: "Kennedy Seigler",
        username: "kennseigler2",
        followersCount: "1.2K",
        streaks: "3",
        likes: "4",
        comments: "2",
        date: "Today",
        favoritePosts: ["kennlarge1", "kennlarge2", "kennlarge3", "kennlarge4", "kennlarge5", "kennlarge6"]
    )
]
struct Profile: View {
    @State private var usersearch: String = ""
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var colorSelection = ColorSelection()
    @State private var settings = false
    @State private var isVideoPickerPresented: Bool = false
    @State private var scrollOffset: CGFloat = .zero
    @State private var activity = false
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
                
                VStack(alignment: .leading, spacing: 3) {
                    Button(action: {
                        activity.toggle()
                    }) {
                        HStack(spacing: 0) {
                            Text("Activity")
                                .font(.system(size: 24, weight: .bold, design: .default))
                                .padding(.trailing, 6)
                                .foregroundColor(.white)
                            
                            Image(systemName: "chevron.right")
                                .bold()
                                .foregroundColor(.gray)
                            
                        }
                        .padding(.horizontal, 17)
                    }
                    .fullScreenCover(isPresented: $activity) {
                        MyActivityExpanded()
                    }
                    .padding(.bottom, 10)
                    MyActivity()
                        .padding(.horizontal, 17)
                        .padding(.bottom, 20)
                    Button(action: {
                        activity.toggle()
                    }) {
                        HStack(spacing: 0) {
                            Text("Favorites")
                                .font(.system(size: 24, weight: .bold, design: .default))
                                .padding(.trailing, 6)
                                .foregroundColor(.white)
                            
                            Image(systemName: "chevron.right")
                                .bold()
                                .foregroundColor(.gray)
                            
                        }
                        .padding(.horizontal, 17)
                        .padding(.bottom, 10)
                    }
                    .fullScreenCover(isPresented: $activity) {
                        MyActivityExpanded()
                    }

                    ProfileRecent()
                        .padding(.bottom, 20)
                        
                        .padding(.horizontal, 13)
                }
                .padding(.top, 13)

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
    private func checkScroll(geo: GeometryProxy) {
        let offset = geo.frame(in: .global).minY
        showToolbar = offset < -200
    }
}

struct ScrollViewOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = VideoViewModel() // Create an instance of VideoViewModel
        Profile()
            .environmentObject(viewModel) // Pass the instance to the environment
    }
}
