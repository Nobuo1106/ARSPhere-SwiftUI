//
//  FilesView.swift
//  ARSphere-SwiftUI
//
//  Created by user on 2022/07/24.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage
    @Environment(\.presentationMode) private var presentationMode
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController:
                                ImagePicker.UIViewControllerType, context: UIViewControllerRepresentableContext<ImagePicker>) {
    }

    
    func makeCoordinator() -> ImagePicker.Coordinator {
        return Coordinator(imagePicker: self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate,UIImagePickerControllerDelegate  {
        let imagePicker: ImagePicker
        init(imagePicker: ImagePicker) {
            self.imagePicker = imagePicker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                guard let imageData = selectedImage.jpegData(compressionQuality: 1.0) else {
                    return
                }
                do {
                    try imageData.write(to: getFileURL(fileName: "IMG1.jpg"))
                    print("Image saved.")
                } catch {
                    print("Failed to save the image:", error)
                }
            }
            imagePicker.presentationMode.wrappedValue.dismiss()
        }
        
        func getFileURL(fileName: String) -> URL {
            let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            return docDir.appendingPathComponent(fileName)
        }
    }
}

//class imagePickerViewModel: ObservableObject {
//    @Published var selectedImage: UIImage = UIImage(named: "default-AR-image")!
//}

//struct ImagePickerView_Preview: PreviewProvider {
//    static var previews: some View {
//        ImagePickerView(ARimage: UIImage(named: "default-AR-image")?)
//    }
//}
