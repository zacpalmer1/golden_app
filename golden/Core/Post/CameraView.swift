//
//  CameraView.swift
//  golden
//
//  Created by Zachary Palmer on 9/3/24.
//
import SwiftUI
import AVFoundation

struct CameraView: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    @Binding var image: UIImage?

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: CameraView

        init(parent: CameraView) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            parent.isPresented = false
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.isPresented = false
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = context.coordinator
        picker.allowsEditing = false
        picker.modalPresentationStyle = .fullScreen // Ensures the camera view takes up the full screen
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    static func dismantleUIViewController(_ uiViewController: UIImagePickerController, coordinator: Self.Coordinator) {
        uiViewController.dismiss(animated: true, completion: nil)
    }
}

struct TestView: View {
    @State private var isCameraPresented = false
    @State private var image: UIImage?

    var body: some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .cornerRadius(15)
                    .padding()
            }
            Button(action: {
                isCameraPresented = true
            }) {
               Text("12:34")
                    .font(.system(size: 24, weight: .heavy, design: .rounded))
                    .foregroundColor(.gray)
            }
        }
        .fullScreenCover(isPresented: $isCameraPresented) {
            CameraView(isPresented: $isCameraPresented, image: $image)
        }
    }
}

