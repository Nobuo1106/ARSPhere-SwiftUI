//
//  FilesView.swift
//  ARSphere-SwiftUI
//
//  Created by user on 2022/07/24.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var ARimage: UIImage
    
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
                
            }
            picker.dismiss(animated: true)
        }
    }
    
}

//struct ImagePickerView_Preview: PreviewProvider {
//    static var previews: some View {
//        ImagePickerView(ARimage: UIImage(named: "default-AR-image")?)
//    }
//}
