import SwiftUI
import UIKit

// Step 1: Custom Blur Background Wrapper
struct VisualEffectBlur: UIViewRepresentable {
    var blurStyle: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: blurStyle))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: blurStyle)
    }
}

// Step 2: Main Tab Bar View with Now Playing and Custom Tab Bar
struct AppleMusicTabBarView: View {
    @State private var selectedTab = Tab.listenNow

    var body: some View {
        ZStack(alignment: .bottom) {
            // Main Content
            TabView(selection: $selectedTab) {
                ForEach(Tab.allCases, id: \.self) { tab in
                    tab.view
                        .tag(tab)
                }
            }

            // Now Playing Bar and Custom Tab Bar
            VStack(spacing: 0) {
                NowPlayingBar()
                    .padding(.horizontal, 16)
                
                CustomTabBar(selectedTab: $selectedTab)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 10)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

// Step 3: Custom Now Playing Bar
struct NowPlayingBar: View {
    var body: some View {
        HStack {
            Image(systemName: "music.note") // Replace with album artwork image
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            
            VStack(alignment: .leading) {
                Text("Song Title")
                    .font(.headline)
                    .lineLimit(1)
                Text("Artist Name")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
            
            Spacer()
            
            HStack(spacing: 20) {
                Button(action: { /* Previous Action */ }) {
                    Image(systemName: "backward.fill")
                        .font(.title3)
                }
                
                Button(action: { /* Play/Pause Action */ }) {
                    Image(systemName: "play.fill")
                        .font(.title3)
                }
                
                Button(action: { /* Next Action */ }) {
                    Image(systemName: "forward.fill")
                        .font(.title3)
                }
            }
            .foregroundColor(.primary)
        }
        .padding()
        .background(VisualEffectBlur(blurStyle: .systemMaterial))
        .cornerRadius(10)
    }
}

// Step 4: Custom Tab Bar with Blur Background
struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.self) { tab in
                Spacer()
                Button(action: {
                    selectedTab = tab
                }) {
                    VStack {
                        Image(systemName: tab.icon)
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(selectedTab == tab ? .red : .gray)
                        Text(tab.title)
                            .font(.caption)
                            .foregroundColor(selectedTab == tab ? .red : .gray)
                    }
                }
                Spacer()
            }
        }
        .padding(.vertical, 10)
        .background(VisualEffectBlur(blurStyle: .systemUltraThinMaterial))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 4)
    }
}

// Tab enum for Tabs
enum Tab: Int, CaseIterable, Identifiable {
    case listenNow, browse, radio, library, search
    
    var id: Int { rawValue }
    
    var title: String {
        switch self {
        case .listenNow: return "Listen Now"
        case .browse: return "Browse"
        case .radio: return "Radio"
        case .library: return "Library"
        case .search: return "Search"
        }
    }
    
    var icon: String {
        switch self {
        case .listenNow: return "play.circle.fill"
        case .browse: return "square.grid.2x2.fill"
        case .radio: return "dot.radiowaves.left.and.right"
        case .library: return "music.note.list"
        case .search: return "magnifyingglass"
        }
    }
    
    var view: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
}

// Preview
struct AppleMusicTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppleMusicTabBarView()
            .previewDevice("iPhone 14 Pro")
    }
}
