//
//  ARView.swift
//  ARSphere-SwiftUI
//
//  Created by user on 2022/07/24.
//

import Foundation
import SwiftUI
import ARKit
import RealityKit

struct ARViewContainer: UIViewRepresentable {
    
    typealias UIViewType = ARView
    
    func makeUIView(context: Context) -> ARView {
        
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

final class ARViewController: ObservableObject {
    static var shared = ARViewContainer()
    @Published var arview: ARView
    init() {
        arview = ARView(frame: .zero)
    }
    
    public func startARSession() {
//        startPlaneDetection()
//        startTapDetection()
    }
    
    private func startTapDetection() {
        arview.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(rezognizer:))))
    }
    
    @objc
    private func handleTap(rezognizer: UITapGestureRecognizer) {
        let tapLocation = rezognizer.location(in: arview)
        let results = arview.raycast(from: tapLocation, allowing: .estimatedPlane, alignment: .horizontal)
    }
}

struct ARViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        ARViewContainer()
    }
}
