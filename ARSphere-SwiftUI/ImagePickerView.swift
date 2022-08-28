//
//  FilesView.swift
//  ARSphere-SwiftUI
//
//  Created by user on 2022/07/24.
//

import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var ARimage: UIImage
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let controller = UIImagePickerController()
        return controller
    }
    
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationBarDelegate {
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                print(selectedImage)
            }
            picker.dismiss(animated: true)
        }
    }
    
    func makeCoordinator() -> ImagePickerView.Coordinator {
        return Coordinator()
    }
    
    func updateUIViewController(_ uiViewController:
                                ImagePickerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ImagePickerView>) {
    }
}

//struct ImagePickerView_Preview: PreviewProvider {
//    static var previews: some View {
//        ImagePickerView(ARimage: UIImage(named: "default-AR-image")?)
//    }
//}
