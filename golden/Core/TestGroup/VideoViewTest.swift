import SwiftUI
import PhotosUI
import AVKit
import AVFoundation

struct VideoView: View {
    @State private var selectedVideoURL: URL?
    @State private var isVideoPickerPresented: Bool = false

    var body: some View {
        VStack {
            if let videoURL = selectedVideoURL {
                VideoPlayerView(url: videoURL)
                    .frame(height: 300)
            } else {
                Text("No video selected")
                    .foregroundColor(.gray)
                    .frame(height: 300)
            }

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
                        .bold()
                }
            }
        }
        .sheet(isPresented: $isVideoPickerPresented) {
            VideoPicker(selectedVideoURL: $selectedVideoURL)
        }
    }
}

struct VideoPlayerView: View {
    @State private var player: AVPlayer?
    var url: URL

    var body: some View {
        VideoPlayer(player: player)
            .onAppear {
                player = AVPlayer(url: url)
                player?.play()
                player?.actionAtItemEnd = .none

                NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem, queue: .main) { _ in
                    player?.seek(to: .zero)
                    player?.play()
                }
            }
            .onDisappear {
                player?.pause()
                player = nil
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .aspectRatio(contentMode: .fit)
    }
}

struct VideoPicker: UIViewControllerRepresentable {
    @Binding var selectedVideoURL: URL?

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.filter = .videos
        configuration.selectionLimit = 1

        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        var parent: VideoPicker

        init(_ parent: VideoPicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)

            guard let result = results.first else { return }

            if result.itemProvider.hasItemConformingToTypeIdentifier(UTType.movie.identifier) {
                result.itemProvider.loadFileRepresentation(forTypeIdentifier: UTType.movie.identifier) { url, error in
                    guard let url = url else {
                        print("Error loading video: \(error?.localizedDescription ?? "Unknown error")")
                        return
                    }

                    if let hevcSupported = self.isHEVC(url: url), !hevcSupported {
                        print("HEVC is not supported on this device. Transcoding...")
                        self.transcodeHEVCToH264(asset: AVAsset(url: url)) { outputURL in
                            DispatchQueue.main.async {
                                self.parent.selectedVideoURL = outputURL
                            }
                        }
                    } else {
                        DispatchQueue.main.async {
                            self.parent.selectedVideoURL = url
                        }
                    }
                }
            }
        }

        // Function to check if the video is HEVC (H.265)
        func isHEVC(url: URL) -> Bool? {
            let asset = AVAsset(url: url)
            let tracks = asset.tracks(withMediaType: .video)

            guard let firstTrack = tracks.first else {
                return nil
            }

            for description in firstTrack.formatDescriptions {
                let formatDesc = description as! CMFormatDescription
                let codec = CMFormatDescriptionGetMediaSubType(formatDesc)

                if codec == kCMVideoCodecType_HEVC {
                    return true
                }
            }
            return false
        }

        // Function to transcode HEVC to H.264
        func transcodeHEVCToH264(asset: AVAsset, completion: @escaping (URL) -> Void) {
            let outputURL = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString).appendingPathExtension("mp4")

            guard let exportSession = AVAssetExportSession(asset: asset, presetName: AVAssetExportPresetHighestQuality) else {
                print("Failed to create AVAssetExportSession")
                return
            }

            exportSession.outputFileType = .mp4
            exportSession.outputURL = outputURL

            exportSession.exportAsynchronously {
                switch exportSession.status {
                case .completed:
                    print("Transcoding completed successfully")
                    completion(outputURL)
                case .failed, .cancelled:
                    print("Transcoding failed or was cancelled")
                default:
                    break
                }
            }
        }
    }
}
struct CustomVideoPlayerView: UIViewControllerRepresentable {
    var url: URL
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let player = AVPlayer(url: url)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        playerViewController.videoGravity = .resizeAspectFill
        
        // Set the audio session category to allow background music to play
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.ambient, mode: .default, options: [.mixWithOthers])
            try audioSession.setActive(true)
        } catch {
            print("Failed to set audio session category: \(error)")
        }
        
        // Hide all controls
        playerViewController.showsPlaybackControls = false

        // Add observer to loop video when it finishes playing
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { _ in
            player.seek(to: .zero)
            player.play() // Replay the video
        }
        
        return playerViewController
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        if let player = uiViewController.player {
            player.play()
        }
    }
}
struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
