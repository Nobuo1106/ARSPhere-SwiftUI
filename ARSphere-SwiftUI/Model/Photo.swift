//
//  Photo.swift
//  ARSphere-SwiftUI
//
//  Created by apple on 2022/09/11.
//

import Foundation
import UIKit

class Photo {
    func isLoadablePhoto() -> Bool {
        let path = getFileURL(fileName: "IMG1").path
        
        if FileManager.default.fileExists(atPath: path) {
            if let _ = UIImage(contentsOfFile: path) {
                return true
            }
            else {
                print("Failed to load the image.")
            }
        }
        else {
            print("Image file not found.")
        }
        return false
    }
    
    func getFileURL(fileName: String) -> URL {
        let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return docDir.appendingPathComponent(fileName)
    }
    
    func fetchFileName () -> String {
        let isLoadble = isLoadablePhoto()
        let filename = isLoadble ? "IMG1" : "default-AR-image"
        return filename
    }
}
