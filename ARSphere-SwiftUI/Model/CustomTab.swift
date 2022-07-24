//
//  CustomTab.swift
//  ARSphere-SwiftUI
//
//  Created by user on 2022/07/24.
//

import Foundation
import Swift


final class CustomTab{
    public func convertToViewName(selectedTab: Tab) -> String {
        switch  selectedTab{
        case .house:
            return "ARView"
        case .folder:
            return "FilesView"
        default:
            return "ARView"
        }
    }
}
