//
//  FilesView.swift
//  ARSphere-SwiftUI
//
//  Created by user on 2022/07/24.
//

import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIViewController {
        let controller = UIImagePickerController()
        controller.delegate = context.coordinator
        return controller
    }
    
    func makeCoordinator() -> ImagePickerView.Coordinator {
        return Coordinator()
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationBarDelegate {
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                print(selectedImage)
            }
        }
    }
    
    func updateUIViewController(_ uiViewController:
                                ImagePickerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ImagePickerView>) {
    }
}

struct FilesView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView()
    }
}
